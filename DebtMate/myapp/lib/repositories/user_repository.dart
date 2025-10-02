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

  Future<UserResponse?> getUserLoginDataById(String userId) async {
    try {
      final response = await userApi.apiUserGetUserGet(userId: userId, includeLogin: true);
      return response.data?.user;
      
    } catch (e) {
      log('Get User by ID error: $e');
      return null;
    }
  }

  Future<bool> updateUserData(UpdateUserRequest request) async {
    try {
      final response = await userApi.apiUserUpdateUserPost(updateUserRequest: request);
      return response.data!.success!;
      
    } catch (e) {
      log('Update user by error: $e');
      return false;
    }
  }
}