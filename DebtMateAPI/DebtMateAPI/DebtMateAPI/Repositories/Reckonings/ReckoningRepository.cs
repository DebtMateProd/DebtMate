using DebtMateAPI.Data;
using DebtMateAPI.Entities;
using Microsoft.EntityFrameworkCore;

namespace DebtMateAPI.Repositories.Reckonings
{
    public class ReckoningRepository : IReckoningRepository
    {
        private readonly AppDbContext _context;

        public ReckoningRepository(AppDbContext context)
        {
            _context = context;
        }

        public async Task<bool> AddNewReckoning(Reckoning reckoning)
        {
            _context.Reckonings.Add(reckoning);
            await _context.SaveChangesAsync();

            return true;
        }

        public async Task<bool> PayDebtBetweenTwoUsers(Guid user1Id, Guid user2Id, string currencyCode)
        {
            var reckoningUsers = await _context.ReckoningUser
            .Include(ru => ru.Reckoning)
            .Where(ru =>
                ((ru.Reckoning.PayerId == user1Id && ru.UserId == user2Id) ||
                (ru.Reckoning.PayerId == user2Id && ru.UserId == user1Id)) && ru.IsPaid == false && ru.Reckoning.CurrencyCode.Equals(currencyCode))
            .ToListAsync();

            if (!reckoningUsers.Any())
            {
                return false;
            }

            foreach (var ru in reckoningUsers)
            {
                ru.IsPaid = true;
                ru.PaidDate = DateTime.UtcNow;
            }

            await _context.SaveChangesAsync();

            return true;
        }


        public async Task<List<ReckoningUser>> GetUserDebts(Guid userId, bool isPaid)
        {
            var thirtyDaysAgo = DateTime.UtcNow.AddDays(-30);

            var query = _context.ReckoningUser
                .Where(ru => ru.UserId == userId && ru.Reckoning.PayerId != userId);

            if (isPaid)
            {
                query = query.Where(ru => ru.IsPaid && ru.PaidDate >= thirtyDaysAgo);
            }
            else
            {
                query = query.Where(ru => !ru.IsPaid);
            }

            return await query
                .Include(ru => ru.Reckoning)
                .Include(ru => ru.User)
                .Include(ru => ru.Reckoning.Payer)
                .ToListAsync();
        }

        public async Task<bool> PayUserDebt(Guid userId, Guid reckoningId)
        {
            var userDebt = await _context.ReckoningUser
                .Where(ru => ru.UserId == userId && ru.ReckoningId == reckoningId)
                .FirstOrDefaultAsync();

            if (userDebt == null)
                return false;

            if (userDebt.IsPaid)
                return true;

            userDebt.IsPaid = true;
            userDebt.PaidDate = DateTime.UtcNow;

            await _context.SaveChangesAsync();

            return true;
        }

        public async Task<List<ReckoningUser>> GetAllUnPaidUserReckonings(Guid userId)
        {
            return await _context.ReckoningUser
                .Include(ru => ru.Reckoning)
                    .ThenInclude(r => r.Payer)
                .Include(ru => ru.User)
                .Where(ru => (ru.UserId == userId || ru.Reckoning.PayerId == userId) && !ru.IsPaid)
                .ToListAsync();
        }

        public async Task<List<ReckoningUser>> GetUsersDebtorsDebts(Guid userId, bool? isPaid)
        {
            var thirtyDaysAgo = DateTime.UtcNow.AddDays(-30);

            var query = _context.ReckoningUser
                .Include(ru => ru.Reckoning)
                    .ThenInclude(r => r.Users)
                .Include(ru => ru.User)
                .Include(ru => ru.Reckoning.Payer)
                .Where(ru => ru.Reckoning.PayerId == userId && ru.UserId != userId)
                .AsQueryable();

            if (isPaid == true)
            {
                query = query.Where(ru => ru.Reckoning.Users.All(u => u.IsPaid));
                query = query.Where(ru => ru.IsPaid && ru.PaidDate >= thirtyDaysAgo);
            }
            else if (isPaid == false)
            {
                query = query.Where(ru => ru.Reckoning.Users.Any(u => !u.IsPaid));
            }  

            return await query.ToListAsync();
        }

        
    }
}
