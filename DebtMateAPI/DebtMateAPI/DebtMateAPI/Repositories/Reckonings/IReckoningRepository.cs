using DebtMateAPI.Entities;

namespace DebtMateAPI.Repositories.Reckonings
{
    public interface IReckoningRepository
    {
        Task<bool> AddNewReckoning(Reckoning reckoning);
        Task<List<ReckoningUser>> GetUserDebts(Guid userId, bool isPaid);
    }
}
