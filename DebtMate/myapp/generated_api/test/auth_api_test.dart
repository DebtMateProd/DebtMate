import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for AuthApi
void main() {
  final instance = Openapi().getAuthApi();

  group(AuthApi, () {
    //Future apiAuthLoginPost({ LoginRequest loginRequest }) async
    test('test apiAuthLoginPost', () async {
      // TODO
    });

    //Future apiAuthRegisterPost({ RegisterRequest registerRequest }) async
    test('test apiAuthRegisterPost', () async {
      // TODO
    });

  });
}
