import 'package:built_collection/src/list.dart';
import 'package:myapp/models/requests/add_new_reckoning_request.dart';
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
      b.debts = ListBuilder<UserDebt>(
        request.debts.map((debt) => UserDebt((d) {
          d.userId = debt.userId;
          d.owedAmount = debt.amount;
        })),
      );
    });

    return await _repository.addNewReckoning(addNewReckoningRequest);
  }
}