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

  Future<List<UserDebtResponse>> getUserDebts(String userId, bool isPaid) async {
    try {
      final response = await reckoningApi.apiReckoningGetUserDebtsGet(userId: userId, isPaid: isPaid);

      return response.data?.userDebts?.toList() ?? [];
    } catch (e) {
      log('Add new friend error: $e');
      return [];
    }
  }

  Future<bool> payUserDebt(PayUserDebtRequest request) async {
    try {
      final response = await reckoningApi.apiReckoningPayUserDebtPost(payUserDebtRequest: request);

      return response.data?.success ?? false;
    } catch (e) {
      log('Pay user debt error: $e');
      return false;
    }
  }

  
  Future<bool> payDebtBetweenTwoUsers(PayDebtBetweenTwoUsersRequest request) async {
    try {
      final response = await reckoningApi.apiReckoningPayDebtBetweenTwoUsersPost(payDebtBetweenTwoUsersRequest: request);

      return response.data?.success ?? false;
    } catch (e) {
      log('Pay debt between two users error: $e');
      return false;
    }
  }

  Future<List<BalanceUser>> getUserBalances(String userId) async {
    try {
      final response = await reckoningApi.apiReckoningGetUserBalanceGet(userId: userId);

      return response.data?.balanceUsers?.toList() ?? [];
    } catch (e) {
      log('Get user balances error: $e');
      return [];
    }
  }

  Future<List<UserDebtorDebts>> getUserDebtorsDebts(String userId, bool? isPaid) async {
    try {
      final response = await reckoningApi.apiReckoningGetUserDebtorsDebtsGet(userId: userId, isPaid: isPaid);

      return response.data?.userDebtorDebts?.toList() ?? [];
    } catch (e) {
      log('Get user debtors debts error: $e');
      return [];
    }
  } 

}