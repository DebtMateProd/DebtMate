namespace DebtMateAPI.Requests.Reckoning
{
    public class PayDebtBetweenTwoUsersRequest
    {
        public Guid User1Id { get; set; }
        public Guid User2Id { get; set; }
        public string CurrencyCode { get; set; }
    }
}
