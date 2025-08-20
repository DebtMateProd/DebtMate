using DebtMateAPI.Entities;
using DebtMateAPI.Requests.Friendship;
using DebtMateAPI.Responses.Currency;
using DebtMateAPI.Responses.Friendship;
using DebtMateAPI.Services.Currencies;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace DebtMateAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    [Authorize]
    public class CurrencyController : ControllerBase
    {
        private readonly ICurrencyService _service;

        public CurrencyController(ICurrencyService service)
        {
            _service = service;
        }

        [HttpGet("getAll")]
        public async Task<ActionResult<GetAllCurrenciesResponse>> GetAllCurrencies()
        {
            List<CurrencyResponse> currencies = await _service.GetAllCurrenciesAsync();

            if(currencies != null)
                return new GetAllCurrenciesResponse { Message = "Get succeeded", Success = true, Currencies = currencies };

            return new GetAllCurrenciesResponse { Message = "Could not get", Success = false, Currencies = [] };   
        }

        [HttpGet("getByCode")]
        public async Task<ActionResult<GetCurrencyByCodeResponse>> GetCurrencyByCode(string code)
        {
            CurrencyResponse? currency = await _service.GetCurrencyByCodeAsync(code.ToUpper());

            if (currency != null)
                return new GetCurrencyByCodeResponse { Message = "Get succeeded", Success = true, Currency = currency };

            return new GetCurrencyByCodeResponse { Message = "Could not get", Success = false };
        }
    }
}
