using DebtMateAPI.Responses.User;

namespace DebtMateAPI.Responses.Reckoning
{
    public class GetUserDebtorDebtsResponse : BaseResponse
    {
        public List<UserDebtorDebts> userDebtorDebts { get; set; } = new List<UserDebtorDebts>();
    }

    public class UserDebtorDebts
    {
        public Guid ReckoningId { get; set; }
        public string ReckoningName { get; set; } = string.Empty;
        public string? Description { get; set; }
        public List<DebtorInfo> Debtors { get; set; } = new();
    }

    public class DebtorInfo
    {
        public UserResponse Debtor { get; set; }
        public float OwedAmount { get; set; }
        public bool IsPaid { get; set; }
    }
}