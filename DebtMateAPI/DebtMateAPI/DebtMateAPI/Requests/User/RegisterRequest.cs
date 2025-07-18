namespace DebtMateAPI.Requests.User
{
    public class RegisterRequest
    {
        required public string Login { get; set; }
        required public string Password { get; set; }
        required public string UserName { get; set; }
    }
}
