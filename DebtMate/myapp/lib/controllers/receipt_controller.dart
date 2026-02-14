import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http_parser/http_parser.dart';
import 'package:myapp/models/requests/analyze_receipt_request.dart';
import 'package:myapp/models/responses/analyze_receipt_response.dart';
import '../repositories/receipt_repository.dart';

class ReceiptController {
  final ReceiptRepository _repository;

  ReceiptController(this._repository);

  Future<AnalyzeReceiptResp> analyzeReceipt(AnalyzeReceiptRequest request) async {
    XFile imageFile = request.file;

    final bytes = await imageFile.readAsBytes();

    String fileName = imageFile.name;
    if (fileName.isEmpty) {
      fileName = "receipt.jpg";
    }

    MediaType contentType = MediaType('image', 'jpeg');
      if (fileName.toLowerCase().endsWith('.png')) {
        contentType = MediaType('image', 'png');
      } else if (fileName.toLowerCase().endsWith('.webp')) {
        contentType = MediaType('image', 'webp');
      }
    
    final multipartFile = MultipartFile.fromBytes(
        bytes,
        filename: fileName,
        contentType: contentType,
      );

    var response = await _repository.analyzeReceipt(multipartFile);

    List<ReceiptItemResp> mappedItems = [];

    if (response?.items != null) {
      mappedItems = response!.items!.map((item) {
        return ReceiptItemResp(
          item: item.item ?? "Nieznany produkt",
          price: item.price ?? 0.0,
        );
      }).toList();
    }

    return AnalyzeReceiptResp(
      success: response?.success ?? false,
      message: response?.message ?? "Wystąpił nieznany błąd",
      items: mappedItems,
    );
  }
}