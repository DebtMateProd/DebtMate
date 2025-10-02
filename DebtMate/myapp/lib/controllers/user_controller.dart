import 'package:myapp/models/requests/update_user_request.dart';
import 'package:myapp/models/responses/user_response.dart';
import 'package:myapp/repositories/user_repository.dart';
import 'package:openapi/openapi.dart';

class UserController {
  final UserRepository _repository;

  UserController(this._repository);

  Future<List<UserResp>> getAllUsers() async {
    List<UserResponse> users = await _repository.getAllUsers();

    return users.map((user) => UserResp(userId: user.userId ?? "", username: user.userName ?? "")).toList();
  }

  Future<UserResp?> getUserById(String userId) async {
    UserResponse? user = await _repository.getUserById(userId);

    if (user == null) {
      return null;
    }

    return UserResp(userId: user.userId ?? "", username: user.userName ?? "");
  }

  Future<UserResp?> getUserLoginDataById(String userId) async {
    UserResponse? user = await _repository.getUserLoginDataById(userId);

    if (user == null) {
      return null;
    }

    return UserResp(userId: user.userId ?? "", username: user.userName ?? "", userLogin: user.userLogin ?? "");
  }

  Future<bool> updateUserData(UpdateUserReq request) async {
    UpdateUserRequest updateUserRequest = UpdateUserRequest((b) {
      b.userId = request.userId;
      b.login = request.login;
      b.password = request.password;
      b.username = request.username;
    });
    
    return await _repository.updateUserData(updateUserRequest);
  }
}