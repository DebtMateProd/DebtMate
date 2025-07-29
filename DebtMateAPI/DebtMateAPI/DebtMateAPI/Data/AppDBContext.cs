using DebtMateAPI.Entities;
using Microsoft.EntityFrameworkCore;

namespace DebtMateAPI.Data
{
    public class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options) { }

        public DbSet<User> Users { get; set; }
        public DbSet<Friendship> Friendships { get; set; }
        public DbSet<Reckoning> Reckonings { get; set; }
        public DbSet<ReckoningUser> ReckoningUser { get; set; }


        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Friendship>()
                .HasKey(f => new { f.UserId1, f.UserId2 });

            modelBuilder.Entity<Friendship>()
                .HasOne(f => f.User1)
                .WithMany()
                .HasForeignKey(f => f.UserId1)
                .OnDelete(DeleteBehavior.Restrict);

            modelBuilder.Entity<Friendship>()
                .HasOne(f => f.User2)
                .WithMany()
                .HasForeignKey(f => f.UserId2)
                .OnDelete(DeleteBehavior.Restrict);

            modelBuilder.Entity<Reckoning>()
                .HasOne(r => r.Payer)
                .WithMany()
                .HasForeignKey(r => r.PayerId)
                .OnDelete(DeleteBehavior.Restrict);

            modelBuilder.Entity<ReckoningUser>()
                .HasKey(ru => ru.Id);

            modelBuilder.Entity<ReckoningUser>()
                .HasOne(ru => ru.Reckoning)
                .WithMany(r => r.Users)
                .HasForeignKey(ru => ru.ReckoningId);

            modelBuilder.Entity<ReckoningUser>()
                .HasOne(ru => ru.User)
                .WithMany()
                .HasForeignKey(ru => ru.UserId);
        }
    }
}
