class RegisterRequest {
  final String login;
  final String password;

  RegisterRequest({required this.login, required this.password});

  Map<String, dynamic> toJson() => {
    'login': login,
    'password': password,
  };
}
