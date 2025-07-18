class RegisterResponse {
  final bool isSuccess;

  RegisterResponse({required this.isSuccess});

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(isSuccess: json['isSuccess']);
  }
}
