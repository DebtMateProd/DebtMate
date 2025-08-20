namespace DebtMateAPI.Responses.Reckoning
{
    public class GetUserDebtResponse : BaseResponse
    {
        public List<UserDebtResponse> UserDebts {  get; set; }
    }

    public class UserDebtResponse
    {
        public Guid ReckoningId { get; set; }
        public string ReckoningName { get; set; } = string.Empty;
        public string Description { get; set; } = string.Empty;
        public float OwedAmount { get; set; }
        public bool IsPaid { get; set; }
        public string CurrencyCode { get; set; } = "PLN";

        public Guid PayerId { get; set; }
        public string PayerName { get; set; } = string.Empty;
    }
}
