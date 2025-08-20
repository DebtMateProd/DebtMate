class UserDebtResp {
  String reckoningId;
  String reckoningName;
  String? description;
  double owedAmount;
  String currencyCode;
  bool isPaid;
  String payerId;
  String payerName;

  UserDebtResp({
    required this.reckoningId,
    required this.reckoningName,
    required this.description,
    required this.owedAmount,
    required this.isPaid,
    required this.payerId,
    required this.payerName,
    required this.currencyCode,
  });
}