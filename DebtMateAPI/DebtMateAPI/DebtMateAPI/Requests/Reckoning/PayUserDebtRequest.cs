namespace DebtMateAPI.Requests.Reckoning
{
    public class PayUserDebtRequest
    {
        public Guid UserId { get; set; }
        public Guid ReckoningId { get; set; }
    }
}
