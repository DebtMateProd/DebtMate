import 'package:myapp/models/requests/login_request.dart';
import 'package:myapp/models/requests/register_request.dart';
import 'package:myapp/models/responses/login_response.dart';
import 'package:openapi/openapi.dart';
import '../repositories/auth_repository.dart';

class AuthController {
  final AuthRepository _repository;

  AuthController(this._repository);

  Future<bool> register(RegisterReq registerRequest) async {
    RegisterRequest request = RegisterRequest((b) {
      b.login = registerRequest.login;
      b.password = registerRequest.password;
      b.userName = registerRequest.userName;
    });

    return await _repository.register(request);
  }

  Future<LoginResp> login(LoginReq loginRequest) async {
    LoginRequest request = LoginRequest((b) {
      b.login = loginRequest.login;
      b.password = loginRequest.password;
    });

    var response = await _repository.login(request);
  
    return LoginResp(
      token: response?.token ?? "", 
      userId: response?.userId ?? "", 
      isSuccess: response?.success ?? false, 
      message: response?.message ?? ""
    );
  }
}
