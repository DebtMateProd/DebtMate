using DebtMateAPI.Data;
using DebtMateAPI.Entities;
using Microsoft.EntityFrameworkCore;

namespace DebtMateAPI.Repositories.Friendships
{
    public class FriendshipRepository : IFriendshipRepository
    {
        private readonly AppDbContext _context;

        public FriendshipRepository(AppDbContext context)
        {
            _context = context;
        }

        public async Task<bool> FriendshipExistsAsync(Guid userId1, Guid userId2)
        {
            return await _context.Friendships.AnyAsync(f =>
                f.UserId1 == userId1 && f.UserId2 == userId2);
        }

        public async Task AddFriendshipAsync(Friendship friendship)
        {
            await _context.Friendships.AddAsync(friendship);
            await _context.SaveChangesAsync();
        }

        public async Task<bool> AcceptFriendship(Guid userId1, Guid userId2)
        {
            Friendship? friendship = await _context.Friendships.FirstOrDefaultAsync(f =>
                f.UserId1 == userId1 && f.UserId2 == userId2);

            if (friendship == null) {
                return false;
            }

            friendship.IsAccepted = true;

            await _context.SaveChangesAsync();
            return true;
        }

        public async Task<bool> RemoveFriendshipAsync(Guid userId1, Guid userId2)
        {
            var friendship = await _context.Friendships.FirstOrDefaultAsync(f =>
                f.UserId1 == userId1 && f.UserId2 == userId2);

            if (friendship == null)
                return false;

            _context.Friendships.Remove(friendship);
            await _context.SaveChangesAsync();
            return true;
        }

        public async Task<List<User>> GetFriendsOfUserAsync(Guid userId)
        {
            var user1Friends = await _context.Friendships
                .Where(f => f.UserId1 == userId && f.IsAccepted == true)
                .Select(f => f.User2)
                .ToListAsync();

            var user2Friends = await _context.Friendships
                .Where(f => f.UserId2 == userId && f.IsAccepted == true)
                .Select(f => f.User1)
                .ToListAsync();

            return user1Friends.Concat(user2Friends).ToList();
        }

        public async Task<List<User>> GetPendingFriendsOfUserAsync(Guid userId)
        {
            var user1Friends = await _context.Friendships
                .Where(f => f.UserId1 == userId && f.IsAccepted == false && f.RequestSenderId != userId)
                .Select(f => f.User2)
                .ToListAsync();

            var user2Friends = await _context.Friendships
                .Where(f => f.UserId2 == userId && f.IsAccepted == false && f.RequestSenderId != userId)
                .Select(f => f.User1)
                .ToListAsync();

            return user1Friends.Concat(user2Friends).ToList();
        }

        public async Task<List<User>> GetPendingFriendRequestsOfUserAsync(Guid userId)
        {
            var user1Friends = await _context.Friendships
                .Where(f => f.UserId1 == userId && f.IsAccepted == false && f.RequestSenderId == userId)
                .Select(f => f.User2)
                .ToListAsync();

            var user2Friends = await _context.Friendships
                .Where(f => f.UserId2 == userId && f.IsAccepted == false && f.RequestSenderId == userId)
                .Select(f => f.User1)
                .ToListAsync();

            return user1Friends.Concat(user2Friends).ToList();
        }
    }
}
