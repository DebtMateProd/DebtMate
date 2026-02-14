using DebtMateAPI.Requests.Receipt;
using DebtMateAPI.Responses.Receipt;
using DebtMateAPI.Services.Receipt;
using Microsoft.AspNetCore.Mvc;

namespace DebtMateAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class ReceiptController : ControllerBase
    {
        private readonly IReceiptService _receiptService;

        public ReceiptController(IReceiptService receiptService)
        {
            _receiptService = receiptService;
        }

        [HttpPost("analyze")]
        [Consumes("multipart/form-data")]
        public async Task<AnalyzeReceiptResponse> AnalyzeReceipt([FromForm] AnalyzeReceiptRequest request)
        {
            try
            {
                var file = request.File;

                if (file == null || file.Length == 0)
                    return new AnalyzeReceiptResponse { Success = false, Message = "File not provided" };

                var items = await _receiptService.AnalyzeReceiptAsync(file);

                return new AnalyzeReceiptResponse
                {
                    Success = true,
                    Message = "Receipt analyzed successfully",
                    Items = items
                };
            }
            catch (ArgumentException ex)
            {
                return new AnalyzeReceiptResponse { Success = false, Message = ex.Message };
            }
            catch (HttpRequestException ex)
            {
                return new AnalyzeReceiptResponse { Success = false, Message = "AI service is currently unavailable or quota exceeded." };
            }
            catch (Exception ex)
            {
                return new AnalyzeReceiptResponse { Success = false, Message = "An error occurred while processing the receipt." };
            }
        }
    }
}
