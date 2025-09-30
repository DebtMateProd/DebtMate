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

  Future<UserResponse?> getUserById(String userId) async {
    try {
      final response = await userApi.apiUserGetUserGet(userId: userId);
      return response.data?.user;
      
    } catch (e) {
      log('Get User by ID error: $e');
      return null;
    }
  }
}