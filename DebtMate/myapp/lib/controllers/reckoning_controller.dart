import 'package:built_collection/src/list.dart';
import 'package:myapp/models/requests/add_new_reckoning_request.dart';
import 'package:myapp/models/requests/pay_debt_between_two_users_request.dart';
import 'package:myapp/models/requests/pay_user_debt_request.dart';
import 'package:myapp/models/responses/reckoning_debtors_response.dart';
import 'package:myapp/models/responses/user_balance_response.dart';
import 'package:myapp/models/responses/user_debt_response.dart';
import 'package:myapp/models/responses/user_response.dart';
import 'package:myapp/repositories/reckoning_repository.dart';
import 'package:openapi/openapi.dart';

class ReckoningController {
  final ReckoningRepository _repository;

  ReckoningController(this._repository);

  Future<bool> addNewReckoning(AddNewReckoningReq request) async {
    AddNewReckoningRequest addNewReckoningRequest = AddNewReckoningRequest((b) {
      b.name = request.name;
      b.description = request.description;
      b.totalCost = request.totalCost;
      b.payerId = request.payerId;
      b.currencyCode = request.currencyCode;
      b.debts = ListBuilder<UserDebt>(
        request.debts.map((debt) => UserDebt((d) {
          d.userId = debt.userId;
          d.owedAmount = debt.amount;
        })),
      );
    });

    return await _repository.addNewReckoning(addNewReckoningRequest);
  }

  Future<List<UserDebtResp>> getUserDebts(String userId, bool isPaid) async {
    List<UserDebtResponse> userDebts = await _repository.getUserDebts(userId, isPaid);

    List<UserDebtResp> debts = userDebts.map((debt) {
      return UserDebtResp(
        reckoningId: debt.reckoningId ?? "",
        reckoningName: debt.reckoningName ?? "",
        description: debt.description,
        owedAmount: debt.owedAmount ?? 0.0,
        isPaid: debt.isPaid ?? false,
        currencyCode: debt.currencyCode ?? "",
        payerId: debt.payerId ?? "",
        payerName: debt.payerName ?? "",
      );
    }).toList();

    return debts;
  }

  Future<bool> payUserDebt(PayUserDebtReq request) async {
    PayUserDebtRequest payUserDebtReq = PayUserDebtRequest((b) {
      b.userId = request.userId;
      b.reckoningId = request.reckoningId;
    });

    return await _repository.payUserDebt(payUserDebtReq);
  }

  Future<bool> payDebtBetweenTwoUsers(PayDebtBetweenTwoUsersReq request) async {
    PayDebtBetweenTwoUsersRequest payDebtBetweenTwoUsersRequest = PayDebtBetweenTwoUsersRequest((b) {
      b.user1Id = request.user1Id;
      b.user2Id = request.user2Id;
      b.currencyCode = request.currencyCode;
    });

    return await _repository.payDebtBetweenTwoUsers(payDebtBetweenTwoUsersRequest);
  }

  Future<List<UserBalanceResp>> getUserBalance(String userId) async {
    List<BalanceUser> userBalances = await _repository.getUserBalances(userId);

    return userBalances.map((balance) {
      return UserBalanceResp(
        user1: UserResp(
          userId: balance.user1?.userId ?? "",
          username: balance.user1?.userName ?? "",
        ),
        user2: UserResp(
          userId: balance.user2?.userId ?? "",
          username: balance.user2?.userName ?? "",
        ),
        balance: balance.balance ?? 0.0,
        currencyCode: balance.currencyCode ?? "",
      );
    }).toList();
  }

  Future<List<ReckoningDebtorsResp>> getDebtsOwedToUser(String userId, bool? isPaid) async {
    List<UserDebtorDebts> userDebtorsDebts = await _repository.getUserDebtorsDebts(userId, isPaid);

    return userDebtorsDebts.map((debtorDebt) {
      return ReckoningDebtorsResp(
        reckoningId: debtorDebt.reckoningId ?? "",
        reckoningName: debtorDebt.reckoningName ?? "",
        description: debtorDebt.description,
        currencyCode: debtorDebt.currencyCode ?? "",
        debtors: debtorDebt.debtors!.map((debtor) => DebtorInfoResp(
          debtorId: debtor.debtor?.userId ?? "",
          debtorName: debtor.debtor?.userName ?? "",
          owedAmount: debtor.owedAmount ?? 0.0,
          isPaid: debtor.isPaid ?? false,
        )).toList(),
      );

    }).toList();
  }

}