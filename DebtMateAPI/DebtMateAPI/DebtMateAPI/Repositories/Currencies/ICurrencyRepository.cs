using DebtMateAPI.Entities;

namespace DebtMateAPI.Repositories.Currencies
{
    public interface ICurrencyRepository
    {
        Task<List<Currency>> GetAllAsync();
        Task<Currency?> GetByCodeAsync(string code);
    }
}
