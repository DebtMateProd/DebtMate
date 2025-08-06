using DebtMateAPI.Requests.Reckoning;
using DebtMateAPI.Responses.Reckoning;
using DebtMateAPI.Services.Reckonings;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using static DebtMateAPI.Requests.Reckoning.AddNewReckoningRequest;

namespace DebtMateAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    [Authorize]
    public class ReckoningController : ControllerBase
    {
        private readonly IReckoningService _reckoningService;

        public ReckoningController(IReckoningService reckoningService)
        {
            _reckoningService = reckoningService;
        }

        [HttpPost("addNewReckoning")]
        public async Task<AddNewReckoningResponse> AddNewReckoning(AddNewReckoningRequest addNewReckoningRequest)
        {
            bool success = await _reckoningService.AddNewReckoning(addNewReckoningRequest);

            if (success)
                return new AddNewReckoningResponse { Message = "Added successfully", Success = true };

            return new AddNewReckoningResponse { Message = "Could not add", Success = false };
        }

        [HttpGet("getUserDebts")]
        public async Task<GetUserDebtResponse> GetUserDebts(Guid userId, bool isPaid)
        {
            List<UserDebtResponse> userDebts = await _reckoningService.GetUserDebts(userId, isPaid);

            if (userDebts != null)
                return new GetUserDebtResponse { Message = "Get succeeded", Success = true, UserDebts = userDebts};

            return new GetUserDebtResponse { Message = "Could not succeed", Success = false };
        }

        [HttpPost("payUserDebt")]
        public async Task<PayUserDebtResponse> PayUserDebt(PayUserDebtRequest request)
        {
            bool success = await _reckoningService.PayUserDebt(request: request);

            if (success)
                return new PayUserDebtResponse { Message = "Pay succeeded", Success = true };

            return new PayUserDebtResponse { Message = "Pay could not succeed", Success = false };
        }

        [HttpGet("getUserBalance")]
        public async Task<BalanceUserResponse> GetUserBalances(Guid userId)
        {
            List<BalanceUser> result = await _reckoningService.GetUserBalances(userId);

            if (result != null)
                return new BalanceUserResponse { Message = "Get succeeded", Success = true,  BalanceUsers = result};

            return new BalanceUserResponse { Message = "Get could not succeed", Success = false };

        }

        [HttpGet("getUserDebtorsDebts")]
        public async Task<GetUserDebtorDebtsResponse> GetUserDebtorsDebts(Guid userId, bool? isPaid)
        {
            List<UserDebtorDebts> userDebtorDebts = await _reckoningService.GetUsersDebtorsDebts(userId, isPaid);

            if (userDebtorDebts != null)
                return new GetUserDebtorDebtsResponse { Message = "Get succeeded", Success = true, userDebtorDebts = userDebtorDebts };

            return new GetUserDebtorDebtsResponse { Message = "Get could not succeed", Success = false };
        }
    }
}
