using DebtMateAPI.Responses.User;

namespace DebtMateAPI.Responses.Friendship
{
    public class GetUserPendingFriendListResponse : BaseResponse
    {
        public List<UserResponse>? Users { get; set; }
    }
}
