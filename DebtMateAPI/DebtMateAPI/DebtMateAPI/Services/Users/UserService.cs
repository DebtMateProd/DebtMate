using System.Security.Cryptography;
using System.Text;
using DebtMateAPI.Entities;
using DebtMateAPI.Helper;
using DebtMateAPI.Repositories.Users;
using DebtMateAPI.Responses.User;

namespace DebtMateAPI.Services.Users
{
    public class UserService : IUserService
    {
        private readonly IUserRepository _repository;
        private readonly JwtHelper _jwtHelper;

        public UserService(IUserRepository repository, JwtHelper jwtHelper)
        {
            _repository = repository;
            _jwtHelper = jwtHelper;
        }

        public async Task<bool> Register(string login, string password, string userName)
        {
            if (await _repository.UserExistsAsync(login))
                return false;

            var hash = HashPassword(password);
            var user = new User
            {
                Login = login,
                PasswordHash = hash,
                UserName = userName,
                CreatedAt = DateTime.UtcNow,
                UpdatedAt = DateTime.UtcNow,
                IsDeleted = false,
            };

            await _repository.AddUserAsync(user);
            return true;
        }

        public async Task<LoginResponse?> Login(string login, string password)
        {
            var user = await _repository.GetByLoginAsync(login);
            if (user == null) return null;

            var hash = HashPassword(password);
            if (user.PasswordHash != hash) return null;

            string token = _jwtHelper.GenerateJwtToken(user.Login);

            return new LoginResponse
            {
                Token = token,
                UserId = user.Id
            };
        }

        public async Task<List<UserResponse>> GetAllUsers()
        {
            List<User> users = await _repository.GetAllAsync();

            return users.Select(user => new UserResponse
            {
                UserId = user.Id,
                UserName = user.UserName
            }).ToList();
        }

        private static string HashPassword(string password)
        {
            using var sha256 = SHA256.Create();
            var bytes = Encoding.UTF8.GetBytes(password);
            var hash = sha256.ComputeHash(bytes);
            return Convert.ToBase64String(hash);
        }
    }
}
