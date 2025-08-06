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

        public async Task<List<ReckoningUser>> GetUserDebts(Guid userId, bool isPaid)
        {
            return await _context.ReckoningUser
                .Where(ru => ru.UserId == userId && ru.IsPaid == isPaid && ru.Reckoning.PayerId != userId)
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
            }
            else if (isPaid == false)
            {
                query = query.Where(ru => ru.Reckoning.Users.Any(u => !u.IsPaid));
            }

            return await query.ToListAsync();
        }

        
    }
}
