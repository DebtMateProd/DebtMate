using DebtMateAPI.Entities;

namespace DebtMateAPI.Repositories.Friendships
{
    public interface IFriendshipRepository
    {
        Task<bool> FriendshipExistsAsync(Guid userId1, Guid userId2);
        Task AddFriendshipAsync(Friendship friendship);
        Task<bool> AcceptFriendship(Guid userId1, Guid userId2);
        Task<bool> RemoveFriendshipAsync(Guid userId1, Guid userId2);
        Task<List<User>> GetFriendsOfUserAsync(Guid userId);
        Task<List<User>> GetPendingFriendsOfUserAsync(Guid userId);
        Task<List<User>> GetPendingFriendRequestsOfUserAsync(Guid userId);
    }
}
