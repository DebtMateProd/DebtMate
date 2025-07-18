using static System.Runtime.InteropServices.JavaScript.JSType;

namespace DebtMateAPI.Responses
{
    public class BaseResponse
    {
        public bool Success { get; set; } = true;
        public string Message { get; set; } = "";

        public BaseResponse() { }
        public BaseResponse(bool success, string message = "")
        {
            Success = success;
            Message = message;
        }
    }
}
