using DebtMateAPI.Requests.User;
using DebtMateAPI.Responses.User;
using DebtMateAPI.Services.Users;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;

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

        [HttpGet("getUser")]
        public async Task<ActionResult<GetUserResponse>> GetUserById(Guid userId, bool includeLogin = false)
        {
            UserResponse? user = await _userService.GetUserById(userId, includeLogin);

            if (user != null)
                return new GetUserResponse { Message = "Get succeeded", Success = true, User = user };

            return new GetUserResponse { Message = "Could not get", Success = false };
        }

        [HttpPost("updateUser")]
        public async Task<ActionResult<UpdateUserResponse>> UpdateUserData(UpdateUserRequest request)
        {
            bool success = await _userService.UpdateUserData(
                userId: request.UserId, 
                login: request.Login, 
                password: request.Password, 
                username: request.Username
            );

            if (success)
                return new UpdateUserResponse { Message = "Update succeeded", Success = true };

            return new UpdateUserResponse { Message = "Could not update", Success = false };
        }
    }
}
