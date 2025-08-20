namespace DebtMateAPI.Responses.Currency
{
    public class GetAllCurrenciesResponse : BaseResponse
    {
        public List<CurrencyResponse> Currencies { get; set; } = new();
    }
}
