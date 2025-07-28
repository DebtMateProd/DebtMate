using DebtMateAPI.Data;
using DebtMateAPI.Helper;
using DebtMateAPI.Repositories.Friendships;
using DebtMateAPI.Repositories.Reckonings;
using DebtMateAPI.Repositories.Users;
using DebtMateAPI.Services.Friendships;
using DebtMateAPI.Services.Reckonings;
using DebtMateAPI.Services.Users;
using Microsoft.EntityFrameworkCore;

namespace DebtMateAPI.Extensions
{
    public static class ServiceCollectionExtensions
    {
        public static IServiceCollection AddApplicationServices(this IServiceCollection services, IConfiguration configuration)
        {
            services.Configure<JwtSettings>(configuration.GetSection("JwtSettings"));

            services.AddDbContext<AppDbContext>(options =>
                options.UseSqlServer(configuration.GetConnectionString("DefaultConnection")));

            services.AddScoped<IUserRepository, UserRepository>();
            services.AddScoped<IUserService, UserService>();
            services.AddScoped<JwtHelper>();
            services.AddScoped<IFriendshipService, FriendshipService>();
            services.AddScoped<IFriendshipRepository, FriendshipRepository>();
            services.AddScoped<IReckoningRepository, ReckoningRepository>();
            services.AddScoped<IReckoningService, ReckoningService>();
            

            return services;
        }
    }
}
