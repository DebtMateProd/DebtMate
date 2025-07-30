using DebtMateAPI.Requests.Friendship;
using DebtMateAPI.Responses.Friendship;
using DebtMateAPI.Services.Friendships;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace DebtMateAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    [Authorize]
    public class FriendshipController : ControllerBase
    {
        private readonly IFriendshipService _friendshipService;

        public FriendshipController(IFriendshipService friendshipService)
        {
            _friendshipService = friendshipService;
        }

        [HttpPost("add")]
        public async Task<AddFriendshipResponse> AddFriendship(AddFriendshipRequest addFriendshipRequest)
        {
            bool success = await _friendshipService.AddFriendship(addFriendshipRequest.User1Id, addFriendshipRequest.User2Id);

            if (success)
                return new AddFriendshipResponse { Message = "Added successfully", Success = true };

            return new AddFriendshipResponse { Message = "Could not add", Success = false };
        }

        [HttpPost("remove")]
        public async Task<RemoveFriendshipResponse> RemoveFriendship(RemoveFriendshipRequest friendshipRequest)
        {
            bool success = await _friendshipService.RemoveFriendship(friendshipRequest.User1Id, friendshipRequest.User2Id);

            if (success)
                return new RemoveFriendshipResponse { Message = "Removed successfully", Success = true };

            return new RemoveFriendshipResponse { Message = "Could not remove", Success = false };
        }

        [HttpPost("accept")]
        public async Task<AcceptFriendshipResponse> AddFriendship(AcceptFriendshipRequest acceptFriendshipRequest)
        {
            bool success = await _friendshipService.AcceptFriendship(acceptFriendshipRequest.User1Id, acceptFriendshipRequest.User2Id);

            if (success)
                return new AcceptFriendshipResponse { Message = "Accepted successfully", Success = true };

            return new AcceptFriendshipResponse { Message = "Could not accept", Success = false };
        }


        [HttpGet("friends/{userId}")]
        public async Task<GetUserFriendListResponse> GetFriends(Guid userId)
        {
            var friends = await _friendshipService.GetUserFriendList(userId);

            if (friends != null)
                return new GetUserFriendListResponse { Message = "Get friends succeeded", Success = true, Users = friends };

            return new GetUserFriendListResponse { Message = "Get friends could not succeed", Success = false, Users = friends };
        }

        [HttpGet("pendingfriends/{userId}")]
        public async Task<GetUserPendingFriendListResponse> GetPendingFriends(Guid userId)
        {
            var friends = await _friendshipService.GetUserPendingFriendList(userId);

            if (friends != null)
                return new GetUserPendingFriendListResponse { Message = "Get pending friends succeeded", Success = true, Users = friends };

            return new GetUserPendingFriendListResponse { Message = "Get pending friends could not succeed", Success = false, Users = friends };
        }

        [HttpGet("friendrequests/{userId}")]
        public async Task<GetUserFriendRequestsListResponse> GetFriendRequests(Guid userId)
        {
            var friends = await _friendshipService.GetUserFriendRequestsList(userId);

            if (friends != null)
                return new GetUserFriendRequestsListResponse { Message = "Get friend requests succeeded", Success = true, Users = friends };

            return new GetUserFriendRequestsListResponse { Message = "Get friend requests could not succeed", Success = false, Users = friends };
        }
    }
}

