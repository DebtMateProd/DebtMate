using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using DebtMateAPI.Entities;
using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;

namespace DebtMateAPI.Helper
{
    public class JwtHelper
    {
        private readonly string SecretKey;
        private readonly int ExpirationTimeInMinutes;
        private readonly string Issuer;
        private readonly string Audience;

        public JwtHelper(IOptions<JwtSettings> jwtSettings)
        {
            SecretKey = jwtSettings.Value.SecretKey;
            ExpirationTimeInMinutes = jwtSettings.Value.ExpirationTimeInMinutes;
            Issuer = jwtSettings.Value.Issuer;
            Audience = jwtSettings.Value.Audience;
        }

        public string GenerateJwtToken(User user)
        {
            var tokenHandler = new JwtSecurityTokenHandler();
            var key = Encoding.ASCII.GetBytes(SecretKey);

            var tokenDescriptor = new SecurityTokenDescriptor
            {
                Subject = new ClaimsIdentity(
                    [ 
                        new Claim(JwtRegisteredClaimNames.Sub, user.Id.ToString()),
                        new Claim(JwtRegisteredClaimNames.UniqueName, user.Login)
                    ]),
                Expires = DateTime.UtcNow.AddMinutes(ExpirationTimeInMinutes),
                SigningCredentials = new SigningCredentials(
                    new SymmetricSecurityKey(key),
                    SecurityAlgorithms.HmacSha256Signature
                ),
                Issuer = Issuer,
                Audience = Audience
            };

            var token = tokenHandler.CreateToken(tokenDescriptor);
            return tokenHandler.WriteToken(token);
        }
    }
}
