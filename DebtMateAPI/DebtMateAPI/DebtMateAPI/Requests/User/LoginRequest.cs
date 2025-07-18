namespace DebtMateAPI.Requests.User
{
    public class LoginRequest
    {
        required public string Login { get; set; }
        required public string Password { get; set; }
    }
} 
