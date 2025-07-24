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
}