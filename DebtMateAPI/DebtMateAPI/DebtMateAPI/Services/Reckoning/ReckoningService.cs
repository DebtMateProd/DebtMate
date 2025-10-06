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
                CurrencyCode = request.CurrencyCode
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

        public async Task<bool> UpdateReckoning(UpdateReckoningRequest request)
        {
            var reckoning = await _repository.GetByIdAsync(request.ReckoningId);

            if (reckoning == null) 
                return false;

            if (request.Name != null) 
                reckoning.Name = request.Name;

            if (request.Description != null) 
                reckoning.Description = request.Description;

            if (request.PayerId.HasValue) 
                reckoning.PayerId = request.PayerId.Value;

            if (request.CurrencyCode != null) 
                reckoning.CurrencyCode = request.CurrencyCode;

            if (request.Debts != null)
            {
                if (request.TotalCost.HasValue)
                {
                    reckoning.TotalCost = request.TotalCost.Value;
                }

                // Map request.UserDebt -> ReckoningUser (service layer mapping)
                var now = DateTime.UtcNow;
                var mapped = request.Debts.Select(d => new ReckoningUser
                {
                    // Id assigned in repository if left Guid.Empty; set here if you prefer
                    Id = Guid.NewGuid(),
                    ReckoningId = reckoning.Id, // repository will ensure consistency too
                    UserId = d.UserId,
                    OwedAmount = d.OwedAmount,
                    IsPaid = d.IsPaid ?? false,
                    PaidDate = (d.IsPaid ?? false) ? now : (DateTime?)null
                }).ToList();

                // Pass entities to repository (no knowledge of request DTO in repo)
                await _repository.ReplaceReckoningUsersAsync(reckoning.Id, mapped);
            }

            // Persist scalar changes (name/description/total/payer/currency)
            await _repository.UpdateAsync(reckoning);
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
                PayerName = ru.Reckoning.Payer.UserName,
                CurrencyCode = ru.Reckoning.CurrencyCode,
            }).ToList();

            return userDebts;
        }

        public async Task<bool> PayUserDebt(PayUserDebtRequest request)
        {
            return await _repository.PayUserDebt(userId: request.UserId, reckoningId: request.ReckoningId);
        }

        public async Task<bool> PayDebtBetweenTwoUsers(PayDebtBetweenTwoUsersRequest request)
        {
            return await _repository.PayDebtBetweenTwoUsers(user1Id: request.User1Id, user2Id: request.User2Id, currencyCode: request.CurrencyCode);
        }

        public async Task<List<BalanceUser>> GetUserBalances(Guid userId)
        {
            List<ReckoningUser> allUserUnpaidReckonings = await _repository.GetAllUnPaidUserReckonings(userId);

            var user = allUserUnpaidReckonings.FirstOrDefault(ru => ru.UserId == userId)?.User ??
               allUserUnpaidReckonings.FirstOrDefault(ru => ru.Reckoning.PayerId == userId)?.Reckoning.Payer;

            if (user == null)
                return new List<BalanceUser>();

            var balanceMap = new Dictionary<(Guid userId, string currencyCode), (float balance, User otherUser)>();


            foreach (var ru in allUserUnpaidReckonings)
            {
                var currencyCode = ru.Reckoning.CurrencyCode;

                if (ru.Reckoning.PayerId == userId && ru.UserId != userId)
                {
                    var key = (ru.UserId, currencyCode);
                    var otherUser = ru.User;
                    if (!balanceMap.ContainsKey(key))
                        balanceMap[key] = (0f, otherUser);

                    balanceMap[key] = (balanceMap[key].balance + ru.OwedAmount, otherUser);
                }
                else if (ru.UserId == userId && ru.Reckoning.PayerId != userId)
                {
                    var key = (ru.Reckoning.PayerId, currencyCode);
                    var otherUser = ru.Reckoning.Payer;
                    if (!balanceMap.ContainsKey(key))
                        balanceMap[key] = (0f, otherUser);

                    balanceMap[key] = (balanceMap[key].balance - ru.OwedAmount, otherUser);
                }
            }

            return GetBalanceListFromDictionary(user, balanceMap);
        }

        public async Task<List<UserDebtorDebts>> GetUsersDebtorsDebts(Guid userId, bool? isPaid)
        {
            List<ReckoningUser> reckoningUsers = await _repository.GetUsersDebtorsDebts(userId, isPaid);

            List<UserDebtorDebts> userDebtorsDebts = reckoningUsers
                .GroupBy(ru => ru.ReckoningId)
                .Select(group => {
                    var reckoning = group.First().Reckoning;

                    return new UserDebtorDebts
                    {
                        ReckoningId = reckoning.Id,
                        ReckoningName = reckoning.Name,
                        Description = reckoning.Description,
                        CurrencyCode = reckoning.CurrencyCode,
                        Debtors = group.Select(ru => new DebtorInfo
                        {
                            Debtor = new UserResponse
                            {
                                UserId = ru.User.Id,
                                UserName = ru.User.UserName,
                            },
                            OwedAmount = ru.OwedAmount,
                            IsPaid = ru.IsPaid
                        }).ToList()
                    };
                }).ToList();

            return userDebtorsDebts;
        }


        private List<BalanceUser> GetBalanceListFromDictionary(User user, Dictionary<(Guid userId, string currencyCode), (float balance, User otherUser)> map)
        {
            var result = new List<BalanceUser>();

            foreach (var entry in map)
            {
                var key = entry.Key;
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
                    CurrencyCode = key.currencyCode, // 👈 teraz waluta z klucza
                    Balance = balance
                });
            }

            return result;
        }
    }
}
