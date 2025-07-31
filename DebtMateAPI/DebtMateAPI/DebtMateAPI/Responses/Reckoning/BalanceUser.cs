using DebtMateAPI.Responses.User;

namespace DebtMateAPI.Responses.Reckoning
{
    public class BalanceUserResponse : BaseResponse
    {
        public List<BalanceUser> BalanceUsers { get; set; }
    }

    public class BalanceUser
    {
        public UserResponse User1 { get; set; }
        public UserResponse User2 { get; set; }
        public float Balance { get; set; }
    }
}
