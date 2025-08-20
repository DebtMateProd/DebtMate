import 'dart:developer';
import 'package:myapp/utils/api_service.dart';
import 'package:openapi/openapi.dart';

class CurrencyRepository {
  final currencyApi = ApiService.instance.currencyApi;

  Future<CurrencyResponse?> getCurrencyByCode(String code) async {
    try {
      final response = await currencyApi.apiCurrencyGetByCodeGet(code: code);
      return response.data!.currency;
      
    } catch (e) {
      log('Get currency error: $e');
      return null;   
    }
  }

  
  Future<List<CurrencyResponse?>> getAllCurrencies() async {
    try {
      final response = await currencyApi.apiCurrencyGetAllGet();

      return response.data!.currencies!.toList();
      
    } catch (e) {
      log('Get all currencies error: $e');
      return [];  
    }
  }
}
