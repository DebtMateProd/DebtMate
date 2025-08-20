using DebtMateAPI.Entities;
using DebtMateAPI.Repositories.Currencies;
using DebtMateAPI.Responses.Currency;

namespace DebtMateAPI.Services.Currencies
{
    public class CurrencyService : ICurrencyService
    {
        private readonly ICurrencyRepository _repository;

        public CurrencyService(ICurrencyRepository repository)
        {
            _repository = repository;
        }

        public async Task<List<CurrencyResponse>> GetAllCurrenciesAsync()
        {
            var currencies = await _repository.GetAllAsync();

            return currencies.Select(c => new CurrencyResponse
            {
                Code = c.Code,
                Symbol = c.Symbol,
                Name = c.Name,
            }).ToList();
        }

        public async Task<CurrencyResponse?> GetCurrencyByCodeAsync(string code)
        {
            var currency = await _repository.GetByCodeAsync(code);

            if (currency == null)
                return null;

            return new CurrencyResponse
            {
                Code = currency.Code,
                Symbol = currency.Symbol,
                Name = currency.Name,
            };
        }
    }
}
