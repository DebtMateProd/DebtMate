import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for ReckoningApi
void main() {
  final instance = Openapi().getReckoningApi();

  group(ReckoningApi, () {
    //Future<AddNewReckoningResponse> apiReckoningAddNewReckoningPost({ AddNewReckoningRequest addNewReckoningRequest }) async
    test('test apiReckoningAddNewReckoningPost', () async {
      // TODO
    });

    //Future<GetUserDebtResponse> apiReckoningGetUserDebtsGet({ String userId, bool isPaid }) async
    test('test apiReckoningGetUserDebtsGet', () async {
      // TODO
    });

  });
}
