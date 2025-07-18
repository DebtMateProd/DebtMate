class User {
  final String login;
  final String password;

  User({required this.login, required this.password});

  Map<String, dynamic> toJson() {
    return {
      'login': login,
      'password': password,
    };
  }
}