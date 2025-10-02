class UpdateUserReq {
  final String userId;
  final String? login;
  final String? password;
  final String? username;

  UpdateUserReq({required this.userId, this.login, this.password, this.username});
}