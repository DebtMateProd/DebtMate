# openapi.api.ReckoningApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiReckoningAddNewReckoningPost**](ReckoningApi.md#apireckoningaddnewreckoningpost) | **POST** /api/Reckoning/addNewReckoning | 
[**apiReckoningGetUserBalanceGet**](ReckoningApi.md#apireckoninggetuserbalanceget) | **GET** /api/Reckoning/getUserBalance | 
[**apiReckoningGetUserDebtorsDebtsGet**](ReckoningApi.md#apireckoninggetuserdebtorsdebtsget) | **GET** /api/Reckoning/getUserDebtorsDebts | 
[**apiReckoningGetUserDebtsGet**](ReckoningApi.md#apireckoninggetuserdebtsget) | **GET** /api/Reckoning/getUserDebts | 
[**apiReckoningPayDebtBetweenTwoUsersPost**](ReckoningApi.md#apireckoningpaydebtbetweentwouserspost) | **POST** /api/Reckoning/payDebtBetweenTwoUsers | 
[**apiReckoningPayUserDebtPost**](ReckoningApi.md#apireckoningpayuserdebtpost) | **POST** /api/Reckoning/payUserDebt | 
[**apiReckoningUpdateReckoningPost**](ReckoningApi.md#apireckoningupdatereckoningpost) | **POST** /api/Reckoning/updateReckoning | 


# **apiReckoningAddNewReckoningPost**
> AddNewReckoningResponse apiReckoningAddNewReckoningPost(addNewReckoningRequest)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getReckoningApi();
final AddNewReckoningRequest addNewReckoningRequest = ; // AddNewReckoningRequest | 

try {
    final response = api.apiReckoningAddNewReckoningPost(addNewReckoningRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ReckoningApi->apiReckoningAddNewReckoningPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **addNewReckoningRequest** | [**AddNewReckoningRequest**](AddNewReckoningRequest.md)|  | [optional] 

### Return type

[**AddNewReckoningResponse**](AddNewReckoningResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiReckoningGetUserBalanceGet**
> BalanceUserResponse apiReckoningGetUserBalanceGet(userId)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getReckoningApi();
final String userId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    final response = api.apiReckoningGetUserBalanceGet(userId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ReckoningApi->apiReckoningGetUserBalanceGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **String**|  | [optional] 

### Return type

[**BalanceUserResponse**](BalanceUserResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiReckoningGetUserDebtorsDebtsGet**
> GetUserDebtorDebtsResponse apiReckoningGetUserDebtorsDebtsGet(userId, isPaid)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getReckoningApi();
final String userId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final bool isPaid = true; // bool | 

try {
    final response = api.apiReckoningGetUserDebtorsDebtsGet(userId, isPaid);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ReckoningApi->apiReckoningGetUserDebtorsDebtsGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **String**|  | [optional] 
 **isPaid** | **bool**|  | [optional] 

### Return type

[**GetUserDebtorDebtsResponse**](GetUserDebtorDebtsResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiReckoningGetUserDebtsGet**
> GetUserDebtResponse apiReckoningGetUserDebtsGet(userId, isPaid)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getReckoningApi();
final String userId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final bool isPaid = true; // bool | 

try {
    final response = api.apiReckoningGetUserDebtsGet(userId, isPaid);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ReckoningApi->apiReckoningGetUserDebtsGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **String**|  | [optional] 
 **isPaid** | **bool**|  | [optional] 

### Return type

[**GetUserDebtResponse**](GetUserDebtResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiReckoningPayDebtBetweenTwoUsersPost**
> PayDebtBetweenTwoUsersResponse apiReckoningPayDebtBetweenTwoUsersPost(payDebtBetweenTwoUsersRequest)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getReckoningApi();
final PayDebtBetweenTwoUsersRequest payDebtBetweenTwoUsersRequest = ; // PayDebtBetweenTwoUsersRequest | 

try {
    final response = api.apiReckoningPayDebtBetweenTwoUsersPost(payDebtBetweenTwoUsersRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ReckoningApi->apiReckoningPayDebtBetweenTwoUsersPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **payDebtBetweenTwoUsersRequest** | [**PayDebtBetweenTwoUsersRequest**](PayDebtBetweenTwoUsersRequest.md)|  | [optional] 

### Return type

[**PayDebtBetweenTwoUsersResponse**](PayDebtBetweenTwoUsersResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiReckoningPayUserDebtPost**
> PayUserDebtResponse apiReckoningPayUserDebtPost(payUserDebtRequest)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getReckoningApi();
final PayUserDebtRequest payUserDebtRequest = ; // PayUserDebtRequest | 

try {
    final response = api.apiReckoningPayUserDebtPost(payUserDebtRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ReckoningApi->apiReckoningPayUserDebtPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **payUserDebtRequest** | [**PayUserDebtRequest**](PayUserDebtRequest.md)|  | [optional] 

### Return type

[**PayUserDebtResponse**](PayUserDebtResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiReckoningUpdateReckoningPost**
> UpdateReckoningResponse apiReckoningUpdateReckoningPost(updateReckoningRequest)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getReckoningApi();
final UpdateReckoningRequest updateReckoningRequest = ; // UpdateReckoningRequest | 

try {
    final response = api.apiReckoningUpdateReckoningPost(updateReckoningRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ReckoningApi->apiReckoningUpdateReckoningPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **updateReckoningRequest** | [**UpdateReckoningRequest**](UpdateReckoningRequest.md)|  | [optional] 

### Return type

[**UpdateReckoningResponse**](UpdateReckoningResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

