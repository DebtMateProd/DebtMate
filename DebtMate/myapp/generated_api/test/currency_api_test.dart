import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for CurrencyApi
void main() {
  final instance = Openapi().getCurrencyApi();

  group(CurrencyApi, () {
    //Future<GetAllCurrenciesResponse> apiCurrencyGetAllGet() async
    test('test apiCurrencyGetAllGet', () async {
      // TODO
    });

    //Future<GetCurrencyByCodeResponse> apiCurrencyGetByCodeGet({ String code }) async
    test('test apiCurrencyGetByCodeGet', () async {
      // TODO
    });

  });
}
