import 'package:myapp/models/responses/user_response.dart';

class UserBalanceResp {
  final UserResp user1;
  final UserResp user2;
  final double balance;

  UserBalanceResp({
    required this.user1,
    required this.user2,
    required this.balance,
  });
}