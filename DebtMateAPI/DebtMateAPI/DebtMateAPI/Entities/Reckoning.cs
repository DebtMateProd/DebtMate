namespace DebtMateAPI.Entities
{
    public class Reckoning
    {
        public Guid Id { get; set; }
        public string Name { get; set; } = string.Empty;
        public string? Description { get; set; }
        public float TotalCost { get; set; }
        public Guid PayerId { get; set; }
        public User Payer { get; set; }

        public ICollection<ReckoningUser> Users { get; set; } = new List<ReckoningUser>();
    }
}
