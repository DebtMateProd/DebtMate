namespace DebtMateAPI.Responses.User
{
    public class UserResponse
    {
        public Guid UserId { get; set; }
        public string UserName { get; set; } = string.Empty;
        public string? UserLogin { get; set; }
    }
}
