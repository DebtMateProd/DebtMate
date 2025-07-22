namespace DebtMateAPI.Requests.Friendship
{
    public class AcceptFriendshipRequest
    {
        required public Guid User1Id { get; set; }
        required public Guid User2Id { get; set; }
    }
}
