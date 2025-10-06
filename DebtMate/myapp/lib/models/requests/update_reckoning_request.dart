import 'package:myapp/models/requests/add_new_reckoning_request.dart';

class UpdateReckoningReq {
  final String id;
  final String name;
  final String description;
  final double totalCost;
  final String payerId;
  final String currencyCode;
  final List<UserDebtReq> debts;

  UpdateReckoningReq({required this.id, required this.name, required this.description, required this.totalCost, required this.payerId, required this.currencyCode, required this.debts});
}