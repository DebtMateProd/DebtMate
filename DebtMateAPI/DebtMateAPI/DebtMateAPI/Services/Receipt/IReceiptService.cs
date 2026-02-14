
using DebtMateAPI.Responses.Receipt;

namespace DebtMateAPI.Services.Receipt
{
    public interface IReceiptService
    {
        Task<List<ReceiptItemResponse>> AnalyzeReceiptAsync(IFormFile file);
    }

}
