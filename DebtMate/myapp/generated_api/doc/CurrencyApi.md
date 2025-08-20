# openapi.api.CurrencyApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiCurrencyGetAllGet**](CurrencyApi.md#apicurrencygetallget) | **GET** /api/Currency/getAll | 
[**apiCurrencyGetByCodeGet**](CurrencyApi.md#apicurrencygetbycodeget) | **GET** /api/Currency/getByCode | 


# **apiCurrencyGetAllGet**
> GetAllCurrenciesResponse apiCurrencyGetAllGet()



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getCurrencyApi();

try {
    final response = api.apiCurrencyGetAllGet();
    print(response);
} catch on DioException (e) {
    print('Exception when calling CurrencyApi->apiCurrencyGetAllGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**GetAllCurrenciesResponse**](GetAllCurrenciesResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiCurrencyGetByCodeGet**
> GetCurrencyByCodeResponse apiCurrencyGetByCodeGet(code)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getCurrencyApi();
final String code = code_example; // String | 

try {
    final response = api.apiCurrencyGetByCodeGet(code);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CurrencyApi->apiCurrencyGetByCodeGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **code** | **String**|  | [optional] 

### Return type

[**GetCurrencyByCodeResponse**](GetCurrencyByCodeResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

