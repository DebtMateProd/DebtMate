using DebtMateAPI.Responses.User;

namespace DebtMateAPI.Services.Users
{
    public interface IUserService
    {
        Task<bool> Register(string login, string password, string userName);
        Task<LoginResponse?> Login(string login, string password);
        Task<List<UserResponse>> GetAllUsers();
    }
}
