using DebtMateAPI.Data;
using DebtMateAPI.Entities;
using DebtMateAPI.Requests.Reckoning;
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

        public async Task<Reckoning?> GetByIdAsync(Guid id)
        {
            return await _context.Reckonings
                            .Include(r => r.Users)
                            .SingleOrDefaultAsync(r => r.Id == id);
        }

        public async Task<bool> UpdateAsync(Reckoning reckoning)
        {
            await _context.SaveChangesAsync();

            return true;
        }

        public async Task<bool> ReplaceReckoningUsersAsync(Guid reckoningId, List<ReckoningUser> newUsers)
        {
            if (newUsers == null)
                return false;

            using var tx = await _context.Database.BeginTransactionAsync();

            // delete existing rows for the reckoning
            var existing = _context.ReckoningUser.Where(x => x.ReckoningId == reckoningId);

            _context.ReckoningUser.RemoveRange(existing);
            await _context.SaveChangesAsync();


            // Insert new rows
            if (newUsers.Any())
            {
                // Ensure ReckoningId is set consistently
                foreach (var u in newUsers)
                {
                    u.ReckoningId = reckoningId;
                    if (u.Id == Guid.Empty) u.Id = Guid.NewGuid();
                }

                await _context.ReckoningUser.AddRangeAsync(newUsers);
                await _context.SaveChangesAsync();
            }

            await tx.CommitAsync();

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
