using DebtMateAPI.Responses;

namespace DebtMateAPI.Requests.Reckoning
{
    public class UpdateReckoningRequest
    {
        public Guid ReckoningId { get; set; }
        public string? Name { get; set; }
        public string? Description { get; set; }
        public float? TotalCost { get; set; }
        public Guid? PayerId { get; set; }
        public string? CurrencyCode { get; set; }

        public List<AddNewReckoningRequest.UserDebt>? Debts { get; set; }
    }
}
