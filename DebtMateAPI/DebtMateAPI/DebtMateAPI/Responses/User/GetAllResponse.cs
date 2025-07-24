namespace DebtMateAPI.Responses.User
{
    public class GetAllResponse : BaseResponse
    {
        public List<UserResponse>? Users { get; set; }
    }
}
