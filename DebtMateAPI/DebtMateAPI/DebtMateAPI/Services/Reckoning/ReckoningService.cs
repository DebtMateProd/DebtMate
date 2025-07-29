using DebtMateAPI.Data;
using DebtMateAPI.Entities;
using DebtMateAPI.Repositories.Friendships;
using DebtMateAPI.Repositories.Reckonings;
using DebtMateAPI.Requests.Reckoning;
using DebtMateAPI.Responses.Reckoning;
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
                reckoning.Users.Add(new ReckoningUser
                {
                    Id = Guid.NewGuid(),
                    UserId = debt.UserId,
                    OwedAmount = debt.OwedAmount,
                    IsPaid = false
                });
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
    }
}
