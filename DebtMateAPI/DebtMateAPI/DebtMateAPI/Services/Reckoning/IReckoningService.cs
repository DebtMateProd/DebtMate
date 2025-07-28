using DebtMateAPI.Requests.Reckoning;
using DebtMateAPI.Responses.Reckoning;

namespace DebtMateAPI.Services.Reckonings
{
    public interface IReckoningService
    {
        Task<bool> AddNewReckoning(AddNewReckoningRequest request);
        Task<List<UserDebtResponse>> GetUserDebts(Guid userId, bool isPaid);

    }
}
