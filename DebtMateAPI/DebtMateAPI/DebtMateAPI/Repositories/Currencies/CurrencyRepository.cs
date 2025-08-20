using DebtMateAPI.Data;
using DebtMateAPI.Entities;
using Microsoft.EntityFrameworkCore;

namespace DebtMateAPI.Repositories.Currencies
{
    public class CurrencyRepository : ICurrencyRepository
    {
        private readonly AppDbContext _context;

        public CurrencyRepository(AppDbContext context)
        {
            _context = context;
        }

        public async Task<List<Currency>> GetAllAsync()
        {
            return await _context.Set<Currency>().ToListAsync();
        }

        public async Task<Currency?> GetByCodeAsync(string code)
        {
            return await _context.Set<Currency>()
                .FirstOrDefaultAsync(c => c.Code == code);
        }
    }
}
