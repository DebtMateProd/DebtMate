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
            var userDebts = await _context.ReckoningUser
                .Where(ru => ru.UserId == userId && ru.IsPaid == isPaid)
                .Include(ru => ru.Reckoning)
                .ToListAsync();

            if(userDebts == null)
            {
                return [];
            }

            return userDebts;
        }
    }
}
