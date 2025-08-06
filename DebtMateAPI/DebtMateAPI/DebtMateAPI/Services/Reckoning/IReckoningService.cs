using DebtMateAPI.Entities;
using DebtMateAPI.Requests.Reckoning;
using DebtMateAPI.Responses.Reckoning;

namespace DebtMateAPI.Services.Reckonings
{
    public interface IReckoningService
    {
        Task<bool> AddNewReckoning(AddNewReckoningRequest request);
        Task<bool> PayUserDebt(PayUserDebtRequest request);
        Task<List<UserDebtResponse>> GetUserDebts(Guid userId, bool isPaid);
        Task<List<BalanceUser>> GetUserBalances(Guid userId);
        Task<List<UserDebtorDebts>> GetUsersDebtorsDebts(Guid userId, bool? isPaid);
    }
}
