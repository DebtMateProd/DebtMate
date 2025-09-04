class PayDebtBetweenTwoUsersReq {
  String user1Id;
  String user2Id;
  String currencyCode;

  PayDebtBetweenTwoUsersReq({
    required this.user1Id,
    required this.user2Id,
    required this.currencyCode
  });
}