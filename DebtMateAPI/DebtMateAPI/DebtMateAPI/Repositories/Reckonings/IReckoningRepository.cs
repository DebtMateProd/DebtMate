using DebtMateAPI.Entities;
using DebtMateAPI.Requests.Reckoning;

namespace DebtMateAPI.Repositories.Reckonings
{
    public interface IReckoningRepository
    {
        Task<bool> AddNewReckoning(Reckoning reckoning);
        Task<Reckoning?> GetByIdAsync(Guid id);
        Task<bool> ReplaceReckoningUsersAsync(Guid reckoningId, List<ReckoningUser> newUsers);
        Task<bool> UpdateAsync(Reckoning reckoning);
        Task<bool> PayDebtBetweenTwoUsers(Guid user1Id,  Guid user2Id, string currencyCode);
        Task<List<ReckoningUser>> GetUserDebts(Guid userId, bool isPaid);
        Task<bool> PayUserDebt(Guid userId, Guid reckoningId);
        Task<List<ReckoningUser>> GetAllUnPaidUserReckonings(Guid userId);
        Task<List<ReckoningUser>> GetUsersDebtorsDebts(Guid userId, bool? isPaid);
    }
}
