class AddNewReckoningReq {
  final String name;
  final String description;
  final double totalCost;
  final String payerId;
  final String currencyCode;
  final List<UserDebtReq> debts;

  AddNewReckoningReq({required this.name, required this.description, required this.totalCost, required this.payerId, required this.currencyCode, required this.debts});
}

class UserDebtReq {
  final String userId;
  final double amount;

  UserDebtReq({required this.userId, required this.amount});
}