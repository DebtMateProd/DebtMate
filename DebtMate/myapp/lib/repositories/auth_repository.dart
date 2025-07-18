import 'dart:developer';
import 'package:myapp/utils/api_service.dart';
import 'package:openapi/openapi.dart';

class AuthRepository {
  final authApi = ApiService.instance.authApi;

  Future<bool> register(RegisterRequest registerRequest) async {
    try {
      final response = await authApi.apiAuthRegisterPost(registerRequest: registerRequest);
      return response.data!.success!;
      
    } catch (e) {
      log('Register error: $e');
      return false;   
    }
  }

  
  Future<LoginResponse?> login(LoginRequest loginRequest) async {
    try {
      final response = await authApi.apiAuthLoginPost(loginRequest: loginRequest);
      return response.data;

    } catch (e) {
      log('Login error: $e');
      return null;
    }
  }
}
