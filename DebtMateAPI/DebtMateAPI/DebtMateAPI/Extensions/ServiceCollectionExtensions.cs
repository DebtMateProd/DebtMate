using DebtMateAPI.Data;
using DebtMateAPI.Helper;
using DebtMateAPI.Repositories.Users;
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

            return services;
        }
    }
}
