using DebtMateAPI.Entities;
using DebtMateAPI.Responses.Currency;

namespace DebtMateAPI.Services.Currencies
{
    public interface ICurrencyService
    {
        Task<List<CurrencyResponse>> GetAllCurrenciesAsync();
        Task<CurrencyResponse?> GetCurrencyByCodeAsync(string code);
    }
}
