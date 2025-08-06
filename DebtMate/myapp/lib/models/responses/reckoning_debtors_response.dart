class ReckoningDebtorsResp {
  String reckoningId;
  String reckoningName;
  String? description;
  List<DebtorInfoResp> debtors;

  ReckoningDebtorsResp({
    required this.reckoningId,
    required this.reckoningName,
    required this.description,
    required this.debtors,
  });
}

class DebtorInfoResp {
  String debtorId;
  String debtorName;
  double owedAmount;
  bool isPaid;

  DebtorInfoResp({
    required this.debtorId,
    required this.debtorName,
    required this.owedAmount,
    required this.isPaid,
  });
}
