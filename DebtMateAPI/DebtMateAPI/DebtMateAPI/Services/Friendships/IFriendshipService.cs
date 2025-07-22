using DebtMateAPI.Responses.User;

namespace DebtMateAPI.Services.Friendships
{
    public interface IFriendshipService
    {
        Task<bool> AddFriendship(Guid user1Id, Guid user2Id);
        Task<bool> RemoveFriendship(Guid user1Id, Guid user2Id);
        Task<bool> AcceptFriendship(Guid user1Id, Guid user2Id);
        Task<List<UserResponse>> GetUserFriendList(Guid userId);
        Task<List<UserResponse>> GetUserPendingFriendList(Guid userId);
        Task<List<UserResponse>> GetUserFriendRequestsList(Guid userId);
    }
}
