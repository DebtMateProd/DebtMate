namespace DebtMateAPI.Responses.User
{
    public class LoginResponse : BaseResponse
    {
        public Guid UserId { get; set; }
        public string Token { get; set; } = string.Empty;
    }
}
