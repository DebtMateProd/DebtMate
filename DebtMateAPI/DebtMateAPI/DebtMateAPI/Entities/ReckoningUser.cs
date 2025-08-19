namespace DebtMateAPI.Entities
{
    public class ReckoningUser
    {
        public Guid Id { get; set; }

        public Guid ReckoningId { get; set; }
        public Reckoning Reckoning { get; set; }

        public Guid UserId { get; set; }
        public User User { get; set; }

        public float OwedAmount { get; set; }
        public bool IsPaid { get; set; } = false;

        public DateTime? PaidDate { get; set; }
    }
}
