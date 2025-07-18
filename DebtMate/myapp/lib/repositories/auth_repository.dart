import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:myapp/models/requests/login_request.dart';
import 'package:myapp/models/requests/register_request.dart';
import 'package:myapp/models/responses/login_response.dart';
import '../config/api_config.dart';

class AuthRepository {

  Future<bool> register(RegisterRequest registerRequest) async {
    final url = Uri.parse('${ApiConfig.baseUrl}/Auth/register');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(registerRequest.toJson()),
      );

      return response.statusCode == 200;
    } catch (e) {
      log('Register error: $e');
      return false;
    }
  }

  Future<LoginResponse?> login(LoginRequest request) async {
    final url = Uri.parse('${ApiConfig.baseUrl}/Auth/login');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(request.toJson()),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return LoginResponse.fromJson(data);
      } else {
        return null;
      }
    } catch (e) {
      log('Login error: $e');
      return null;
    }
  }
}
