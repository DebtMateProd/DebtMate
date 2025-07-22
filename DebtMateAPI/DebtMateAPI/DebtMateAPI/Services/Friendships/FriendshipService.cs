using DebtMateAPI.Entities;
using DebtMateAPI.Repositories.Friendships;
using DebtMateAPI.Responses.User;

namespace DebtMateAPI.Services.Friendships
{
    public class FriendshipService : IFriendshipService
    {
        private readonly IFriendshipRepository _repository;

        public FriendshipService(IFriendshipRepository repository)
        {
            _repository = repository;
        }

        public async Task<bool> AddFriendship(Guid user1Id, Guid user2Id)
        {
            if (user1Id == user2Id)
                return false;

            var (lesserId, greaterId) = user1Id.CompareTo(user2Id) < 0
                ? (user1Id, user2Id)
                : (user2Id, user1Id);

            if (await _repository.FriendshipExistsAsync(lesserId, greaterId))
                return false;

            var friendship = new Friendship
            {
                UserId1 = lesserId,
                UserId2 = greaterId,
                IsAccepted = false,
                RequestSenderId = user1Id,
            };

            await _repository.AddFriendshipAsync(friendship);
            return true;
        }

        public async Task<bool> AcceptFriendship(Guid user1Id, Guid user2Id)
        {
            if (user1Id == user2Id)
                return false;

            var (lesserId, greaterId) = user1Id.CompareTo(user2Id) < 0
                ? (user1Id, user2Id)
                : (user2Id, user1Id);

            await _repository.AcceptFriendship(lesserId, greaterId);
            return true;
        }

        public async Task<bool> RemoveFriendship(Guid user1Id, Guid user2Id)
        {
            var (lesserId, greaterId) = user1Id.CompareTo(user2Id) < 0
                ? (user1Id, user2Id)
                : (user2Id, user1Id);

            var success = await _repository.RemoveFriendshipAsync(lesserId, greaterId);
            return success;
        }

        public async Task<List<UserResponse>> GetUserFriendList(Guid userId)
        {
            List<User> friends = await _repository.GetFriendsOfUserAsync(userId);

            return friends.Select(friend => new UserResponse
            {
                UserId = friend.Id,
                UserName = friend.UserName
            }).ToList();
        }

        public async Task<List<UserResponse>> GetUserPendingFriendList(Guid userId)
        {
            List<User> friends = await _repository.GetPendingFriendsOfUserAsync(userId);

            return friends.Select(friend => new UserResponse
            {
                UserId = friend.Id,
                UserName = friend.UserName
            }).ToList();
        }

        public async Task<List<UserResponse>> GetUserFriendRequestsList(Guid userId)
        {
            List<User> friends = await _repository.GetPendingFriendRequestsOfUserAsync(userId);

            return friends.Select(friend => new UserResponse
            {
                UserId = friend.Id,
                UserName = friend.UserName
            }).ToList();
        }
    }
}
