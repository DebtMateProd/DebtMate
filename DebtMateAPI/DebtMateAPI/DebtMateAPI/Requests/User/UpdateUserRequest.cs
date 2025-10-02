namespace DebtMateAPI.Requests.User
{
    public class UpdateUserRequest
    {
        required public Guid UserId { get; set; }
        required public string? Login { get; set; }
        required public string? Password { get; set; }
        required public string? Username { get; set; }
    }
}
