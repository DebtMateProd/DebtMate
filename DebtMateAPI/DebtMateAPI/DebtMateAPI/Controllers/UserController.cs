using DebtMateAPI.Responses.User;
using DebtMateAPI.Services.Users;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace DebtMateAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    [Authorize]
    public class UserController : ControllerBase
    {
        private readonly IUserService _userService;

        public UserController(IUserService userService)
        {
            _userService = userService;
        }

        [HttpGet("getAllUsers")]
        public async Task<GetAllResponse> GetAllUsers()
        {
            List<UserResponse> users = await _userService.GetAllUsers();

            if (users.Count > 0)
                return new GetAllResponse { Message = "Get succeeded", Success = true, Users = users} ;

            return new GetAllResponse { Message = "Could not get", Success = false };
        }
    }
}
