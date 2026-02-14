using DebtMateAPI.Entities;
using DebtMateAPI.Responses.Receipt;
using System.Text;
using System.Text.Json;

namespace DebtMateAPI.Services.Receipt
{
    public class ReceiptService : IReceiptService
    {
        private readonly IConfiguration _configuration;
        private readonly HttpClient _httpClient;

        private const long MaxFileSize = 5 * 1024 * 1024;
        private readonly string[] AllowedMimeTypes = { "image/jpeg", "image/png", "image/jpg", "image/webp" };

        public ReceiptService(IConfiguration configuration, HttpClient httpClient)
        {
            _configuration = configuration;
            _httpClient = httpClient;
        }

        public async Task<List<ReceiptItemResponse>> AnalyzeReceiptAsync(IFormFile file)
        {
            if (file.Length > MaxFileSize)
                throw new ArgumentException("File size exceeds the 5MB limit.");

            if (!AllowedMimeTypes.Contains(file.ContentType.ToLower()))
                throw new ArgumentException("Invalid file type. Only JPEG, PNG, and WebP are allowed.");

            using var ms = new MemoryStream();
            await file.CopyToAsync(ms);
            var base64Image = Convert.ToBase64String(ms.ToArray());

            var requestBody = new
            {
                contents = new[]
                {
                    new
                    {
                        parts = new object[]
                        {
                            new { text = "Przeanalizuj to zdjęcie paragonu. Wypisz listę zakupionych produktów i ich ceny. Zasady: 1. Ignoruj rabaty, sumy końcowe i daty. 2. Cenę podaj jako liczbę (float). 3. Zwróć WYŁĄCZNIE czysty JSON: [{\"item\":\"Nazwa produktu\",\"price\":0.00}]" },
                            new
                            {
                                inline_data = new
                                {
                                    mime_type = file.ContentType,
                                    data = base64Image
                                }
                            }
                        }
                    }
                },
                generationConfig = new
                {
                    temperature = 0.0
                }
            };

            var apiKey = _configuration["Gemini:ApiKey"];
            var model = _configuration["Gemini:Model"];
            var url = $"https://generativelanguage.googleapis.com/v1beta/models/{model}:generateContent?key={apiKey}";

            using var requestMessage = new HttpRequestMessage(HttpMethod.Post, url);
            requestMessage.Content = new StringContent(JsonSerializer.Serialize(requestBody), Encoding.UTF8, "application/json");

            var response = await _httpClient.SendAsync(requestMessage);

            if (!response.IsSuccessStatusCode)
            {
                var errorContent = await response.Content.ReadAsStringAsync();
                throw new HttpRequestException($"Gemini API Error: {response.StatusCode} - {errorContent}");
            }

            var jsonResponse = await response.Content.ReadAsStringAsync();

            try
            {
                using var doc = JsonDocument.Parse(jsonResponse);

                if (!doc.RootElement.TryGetProperty("candidates", out var candidates) || candidates.GetArrayLength() == 0)
                {
                    return new List<ReceiptItemResponse>();
                }

                var text = candidates[0]
                    .GetProperty("content")
                    .GetProperty("parts")[0]
                    .GetProperty("text")
                    .GetString();

                if (string.IsNullOrWhiteSpace(text)) return new List<ReceiptItemResponse>();

                var cleanJson = text
                    .Replace("```json", "")
                    .Replace("```", "")
                    .Trim();

                var startIndex = cleanJson.IndexOf('[');
                var endIndex = cleanJson.LastIndexOf(']');
                if (startIndex >= 0 && endIndex > startIndex)
                {
                    cleanJson = cleanJson.Substring(startIndex, endIndex - startIndex + 1);
                }
                else
                {
                    return new List<ReceiptItemResponse>();
                }

                var items = JsonSerializer.Deserialize<List<ReceiptItemResponse>>(cleanJson,
                    new JsonSerializerOptions { PropertyNameCaseInsensitive = true });

                return items ?? new List<ReceiptItemResponse>();
            }
            catch (JsonException)
            {
                throw new InvalidOperationException("Failed to parse receipt data from AI response.");
            }

        }
    }
}
