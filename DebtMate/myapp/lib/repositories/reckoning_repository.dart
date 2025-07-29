import 'dart:developer';

import 'package:myapp/utils/api_service.dart';
import 'package:openapi/openapi.dart';

class ReckoningRepository {
  final reckoningApi = ApiService.instance.reckoningApi;

  Future<bool> addNewReckoning(AddNewReckoningRequest request) async {
    try {
      final response = await reckoningApi.apiReckoningAddNewReckoningPost(addNewReckoningRequest: request);

      return response.data?.success ?? false;
    } catch (e) {
      log('Add new friend error: $e');
      return false;
    }
  }

  Future<List<UserDebtResponse>> getUserDebts(String userId) async {
    try {
      final response = await reckoningApi.apiReckoningGetUserDebtsGet(userId: userId);

      return response.data?.userDebts?.toList() ?? [];
    } catch (e) {
      log('Add new friend error: $e');
      return [];
    }
  }
}