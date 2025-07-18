import 'package:myapp/models/requests/login_request.dart';
import 'package:myapp/models/requests/register_request.dart';
import 'package:myapp/models/responses/login_response.dart';
import '../repositories/auth_repository.dart';

class AuthController {
  final AuthRepository _repository;

  AuthController(this._repository);

  Future<bool> register(String login, String password) async {
    RegisterRequest registerRequest = RegisterRequest(login: login, password: password);
    return await _repository.register(registerRequest);
  }

  Future<LoginResponse?> login(String login, String password) async {
    LoginRequest loginRequest = LoginRequest(login: login, password: password);
    return await _repository.login(loginRequest);
  }
}
