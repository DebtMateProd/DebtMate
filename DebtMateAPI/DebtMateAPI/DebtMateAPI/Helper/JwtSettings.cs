namespace DebtMateAPI.Helper
{
    public class JwtSettings
    {
        public string SecretKey { get; set; } = string.Empty;
        public int ExpirationTimeInMinutes { get; set; }
        public string Issuer { get; set;} = string.Empty;
        public string Audience { get; set;} = string.Empty;
    }
}