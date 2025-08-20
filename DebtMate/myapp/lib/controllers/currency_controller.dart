import 'package:myapp/models/responses/currency_response.dart';
import 'package:myapp/repositories/currency_repository.dart';

class CurrencyController {
  final CurrencyRepository _repository;

  CurrencyController(this._repository);

  Future<CurrencyResp> getCurrencyByCode(String code) async {
    var response = await _repository.getCurrencyByCode(code);

    CurrencyResp currencyResp = CurrencyResp(
      code: response?.code ?? "",
      name: response?.name ?? "",
      symbol: response?.symbol ?? "",
    );

    return currencyResp;
  }

  Future<List<CurrencyResp>> getAllCurrencies() async {
    var response = await _repository.getAllCurrencies();

    List<CurrencyResp> currencies = response.map((currency) {
      return CurrencyResp(
        code: currency?.code ?? "",
        name: currency?.name ?? "",
        symbol: currency?.symbol ?? "",
      );
    }).toList();

    return currencies;
  }
}
