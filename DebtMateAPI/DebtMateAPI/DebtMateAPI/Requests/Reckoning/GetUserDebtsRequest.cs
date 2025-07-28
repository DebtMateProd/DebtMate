namespace DebtMateAPI.Requests.Reckoning
{
    public class GetUserDebtsRequest
    {
        public Guid UserId { get; set; }
        public bool IsDebtPaid { get; set; }
    }
}
