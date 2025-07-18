namespace DebtMateAPI.Entities
{
    public class User : BaseEntity
    {
        public string Login { get; set; } = string.Empty;
        public string PasswordHash { get; set; } = string.Empty;
        public string UserName { get; set; } = string.Empty;
    }
}
