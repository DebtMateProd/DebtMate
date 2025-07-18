using DebtMateAPI.Requests.User;
using DebtMateAPI.Responses.User;
using DebtMateAPI.Services.Users;
using Microsoft.AspNetCore.Mvc;

namespace DebtMateAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class AuthController : ControllerBase
    {
        private readonly IUserService _userService;

        public AuthController(IUserService userService)
        {
            _userService = userService;
        }

        [HttpPost("register")]
        public async Task<IActionResult> Register(RegisterRequest request)
        {
            bool success = await _userService.Register(request.Login, request.Password, request.UserName);

            if (success)
                return Ok(new RegisterResponse { Message = "Registered successfully", Success = true});

            return BadRequest(new RegisterResponse { Message = "Could not register", Success = false });
        }

        [HttpPost("login")]
        public async Task<IActionResult> Login(LoginRequest request)
        {
            LoginResponse? loginResponse = await _userService.Login(request.Login, request.Password);

            if (loginResponse != null)
                return Ok(loginResponse);

            return BadRequest(new LoginResponse { Message = "Login failed", Success = false });
        }
    }
}
