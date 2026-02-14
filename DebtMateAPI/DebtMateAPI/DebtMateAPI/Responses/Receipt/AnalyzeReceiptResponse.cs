namespace DebtMateAPI.Responses.Receipt
{
    public class AnalyzeReceiptResponse
    {
        public bool Success { get; set; }
        public string Message { get; set; }
        public List<ReceiptItemResponse> Items { get; set; }

    }

    public class ReceiptItemResponse
    {
        public string Item { get; set; }
        public decimal Price { get; set; }
    }
}
