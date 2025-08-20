namespace DebtMateAPI.Entities
{
    public class Currency
    {
        public string Code { get; set; } = string.Empty;
        public string Symbol { get; set; } = string.Empty; 
        public string Name { get; set; } = string.Empty;

        public ICollection<Reckoning> Reckonings { get; set; } = new List<Reckoning>();
    }
}