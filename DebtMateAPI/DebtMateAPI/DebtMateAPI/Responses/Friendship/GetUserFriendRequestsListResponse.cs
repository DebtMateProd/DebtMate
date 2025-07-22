using DebtMateAPI.Responses.User;

namespace DebtMateAPI.Responses.Friendship
{
    public class GetUserFriendRequestsListResponse : BaseResponse
    {
        public List<UserResponse>? Users { get; set; }
    }
}
