import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for UserApi
void main() {
  final instance = Openapi().getUserApi();

  group(UserApi, () {
    //Future<GetAllResponse> apiUserGetAllUsersGet() async
    test('test apiUserGetAllUsersGet', () async {
      // TODO
    });

  });
}
