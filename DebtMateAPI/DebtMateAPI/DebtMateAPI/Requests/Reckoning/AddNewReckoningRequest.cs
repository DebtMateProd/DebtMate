namespace DebtMateAPI.Requests.Reckoning
{
    public class AddNewReckoningRequest
    {
        public string Name { get; set; } = string.Empty;
        public string? Description { get; set; }
        public float TotalCost { get; set; }
        public Guid PayerId { get; set; }

        public List<UserDebt> Debts { get; set; } = new();

        public class UserDebt
        {
            public Guid UserId { get; set; }
            public float OwedAmount { get; set; }
        }
    }
}
