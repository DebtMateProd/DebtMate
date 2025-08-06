using DebtMateAPI.Entities;

namespace DebtMateAPI.Repositories.Reckonings
{
    public interface IReckoningRepository
    {
        Task<bool> AddNewReckoning(Reckoning reckoning);
        Task<List<ReckoningUser>> GetUserDebts(Guid userId, bool isPaid);
        Task<bool> PayUserDebt(Guid userId, Guid reckoningId);
        Task<List<ReckoningUser>> GetAllUnPaidUserReckonings(Guid userId);
        Task<List<ReckoningUser>> GetUsersDebtorsDebts(Guid userId, bool? isPaid);
    }
}
