class LoginResp {
  final String token;
  final String userId;
  final bool isSuccess;
  final String message;

  LoginResp({required this.token, required this.userId, required this.isSuccess, required this.message});
}
