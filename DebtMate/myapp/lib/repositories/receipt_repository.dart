import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:myapp/utils/api_service.dart';
import 'package:openapi/openapi.dart';

class ReceiptRepository {
  final receiptApi = ApiService.instance.receiptApi;

  Future<AnalyzeReceiptResponse?> analyzeReceipt(MultipartFile file) async {
    try {
      final response = await receiptApi.apiReceiptAnalyzePost(file: file);

      return response.data;
    } catch (e) {
      log('Analyze receipt error: $e');
      return null;
    }
  }
}