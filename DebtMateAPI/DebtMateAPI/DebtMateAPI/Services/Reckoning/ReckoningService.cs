using DebtMateAPI.Data;
using DebtMateAPI.Entities;
using DebtMateAPI.Repositories.Friendships;
using DebtMateAPI.Repositories.Reckonings;
using DebtMateAPI.Requests.Reckoning;
using DebtMateAPI.Responses.Reckoning;
using DebtMateAPI.Responses.User;
using Microsoft.EntityFrameworkCore;
using static DebtMateAPI.Requests.Reckoning.AddNewReckoningRequest;

namespace DebtMateAPI.Services.Reckonings
{
    public class ReckoningService : IReckoningService
    {
        private readonly IReckoningRepository _repository;
        public ReckoningService(IReckoningRepository repository)
        {
            _repository = repository;
        }

        public async Task<bool> AddNewReckoning(AddNewReckoningRequest request)
        {
            var reckoning = new Reckoning
            {
                Id = Guid.NewGuid(),
                Name = request.Name,
                Description = request.Description,
                TotalCost = request.TotalCost,
                PayerId = request.PayerId,
            };

            foreach (var debt in request.Debts)
            {
                if(debt.UserId != request.PayerId)
                {
                    reckoning.Users.Add(new ReckoningUser
                    {
                        Id = Guid.NewGuid(),
                        UserId = debt.UserId,
                        OwedAmount = debt.OwedAmount,
                        IsPaid = false
                    });
                }
            }

            await _repository.AddNewReckoning(reckoning);

            return true;
        }

        public async Task<List<UserDebtResponse>> GetUserDebts(Guid userId, bool isPaid)
        {
            List<ReckoningUser> reckoningUsers = await _repository.GetUserDebts(userId: userId, isPaid: isPaid);

            List<UserDebtResponse> userDebts = reckoningUsers.Select(ru => new UserDebtResponse
            {
                ReckoningId = ru.ReckoningId,
                ReckoningName = ru.Reckoning.Name,
                Description = ru.Reckoning.Description ?? "",
                OwedAmount = ru.OwedAmount,
                IsPaid = ru.IsPaid,
                PayerId = ru.Reckoning.PayerId,
                PayerName = ru.Reckoning.Payer.UserName
            }).ToList();

            return userDebts;
        }

        public async Task<bool> PayUserDebt(PayUserDebtRequest request)
        {
            return await _repository.PayUserDebt(userId: request.UserId, reckoningId: request.ReckoningId);
        }

        public async Task<List<BalanceUser>> GetUserBalances(Guid userId)
        {
            List<ReckoningUser> allUserUnpaidReckonings = await _repository.GetAllUnPaidUserReckonings(userId);

            var user = allUserUnpaidReckonings.FirstOrDefault(ru => ru.UserId == userId)?.User ??
               allUserUnpaidReckonings.FirstOrDefault(ru => ru.Reckoning.PayerId == userId)?.Reckoning.Payer;

            if (user == null)
                return new List<BalanceUser>();

            var balanceMap = new Dictionary<Guid, (float balance, User otherUser)>();

            foreach (var ru in allUserUnpaidReckonings)
            {
                if (ru.Reckoning.PayerId == userId && ru.UserId != userId)
                {
                    var key = ru.UserId;
                    var otherUser = ru.User;
                    if (!balanceMap.ContainsKey(key))
                        balanceMap[key] = (0f, otherUser);

                    balanceMap[key] = (balanceMap[key].balance + ru.OwedAmount, otherUser);
                }
                else if (ru.UserId == userId && ru.Reckoning.PayerId != userId)
                {
                    var key = ru.Reckoning.PayerId;
                    var otherUser = ru.Reckoning.Payer;
                    if (!balanceMap.ContainsKey(key))
                        balanceMap[key] = (0f, otherUser);

                    balanceMap[key] = (balanceMap[key].balance - ru.OwedAmount, otherUser);
                }
            }

            return GetBalanceListFromDictionary(user, balanceMap);
        }

        private List<BalanceUser> GetBalanceListFromDictionary(User user, Dictionary<Guid, (float balance, User otherUser)> map)
        {
            var result = new List<BalanceUser>();

            foreach (var entry in map)
            {
                var otherUser = entry.Value.otherUser;
                var balance = entry.Value.balance;

                result.Add(new BalanceUser
                {
                    User1 = new UserResponse
                    {
                        UserId = user.Id,
                        UserName = user.UserName,
                    },
                    User2 = new UserResponse
                    {
                        UserId = otherUser.Id,
                        UserName = otherUser.UserName,
                    },
                    Balance = balance
                });
            }

            return result;
        }
    }
}
