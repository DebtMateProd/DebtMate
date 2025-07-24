using DebtMateAPI.Entities;

namespace DebtMateAPI.Repositories.Users
{
    public interface IUserRepository
    {
        Task<bool> UserExistsAsync(string login);
        Task AddUserAsync(User user);
        Task<User?> GetByLoginAsync(string login);
        Task<List<User>> GetAllAsync();
    }
}
