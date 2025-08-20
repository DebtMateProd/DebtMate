namespace DebtMateAPI.Responses.Currency
{
    public class GetCurrencyByCodeResponse : BaseResponse 
    {
        public CurrencyResponse? Currency { get; set; }
    }

    public class CurrencyResponse
    {
        public string Code { get; set; } = string.Empty;
        public string Symbol { get; set; } = string.Empty;
        public string Name { get; set; } = string.Empty;
    }
}
