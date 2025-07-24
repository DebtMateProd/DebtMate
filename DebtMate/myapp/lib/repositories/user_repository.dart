import 'dart:developer';

import 'package:myapp/utils/api_service.dart';
import 'package:openapi/openapi.dart';

class UserRepository {
  final userApi = ApiService.instance.userApi;

  Future<List<UserResponse>> getAllUsers() async {
    try {
      final response = await userApi.apiUserGetAllUsersGet();
      return response.data?.users?.toList() ?? [];
      
    } catch (e) {
      log('Get User error: $e');
      return [];
    }
  }
}