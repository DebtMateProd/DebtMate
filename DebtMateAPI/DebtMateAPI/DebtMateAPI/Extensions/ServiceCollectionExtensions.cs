using DebtMateAPI.Data;
using DebtMateAPI.Helper;
using DebtMateAPI.Repositories.Currencies;
using DebtMateAPI.Repositories.Friendships;
using DebtMateAPI.Repositories.Reckonings;
using DebtMateAPI.Repositories.Users;
using DebtMateAPI.Services.Currencies;
using DebtMateAPI.Services.Friendships;
using DebtMateAPI.Services.Reckonings;
using DebtMateAPI.Services.Users;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using System.Text;

namespace DebtMateAPI.Extensions
{
    public static class ServiceCollectionExtensions
    {
        public static IServiceCollection AddApplicationServices(this IServiceCollection services, IConfiguration configuration)
        {
            IConfigurationSection jwtSettingsSection = configuration.GetSection("JwtSettings");

            services.Configure<JwtSettings>(jwtSettingsSection);

            services.AddDbContext<AppDbContext>(options =>
                options.UseMySql(configuration.GetConnectionString("DefaultConnection"),
                    new MySqlServerVersion(new Version(8, 0, 42))));

            services.AddScoped<IUserRepository, UserRepository>();
            services.AddScoped<IUserService, UserService>();
            services.AddScoped<JwtHelper>();
            services.AddScoped<IFriendshipService, FriendshipService>();
            services.AddScoped<IFriendshipRepository, FriendshipRepository>();
            services.AddScoped<IReckoningRepository, ReckoningRepository>();
            services.AddScoped<IReckoningService, ReckoningService>();
            services.AddScoped<ICurrencyService, CurrencyService>();
            services.AddScoped<ICurrencyRepository, CurrencyRepository>();

            return services;
        }

        public static IServiceCollection AddSwaggerGenWithAuth(this IServiceCollection services)
        {
            services.AddSwaggerGen(o =>
            {
                var securityScheme = new OpenApiSecurityScheme
                {
                    Name = "JwtAuthentication",
                    Description = "Enter your JWT token in this field",
                    In = ParameterLocation.Header,
                    Type = SecuritySchemeType.Http,
                    Scheme = JwtBearerDefaults.AuthenticationScheme,
                    BearerFormat = "JWT"
                };

                o.AddSecurityDefinition(JwtBearerDefaults.AuthenticationScheme, securityScheme);

                var securityRequirement = new OpenApiSecurityRequirement
                {
                    {
                        new OpenApiSecurityScheme
                        {
                            Reference = new OpenApiReference
                            {
                                Type = ReferenceType.SecurityScheme,
                                Id = JwtBearerDefaults.AuthenticationScheme
                            }
                        },
                        []
                    }
                };

                o.AddSecurityRequirement(securityRequirement);
            });

            return services;
        }
    }
}
