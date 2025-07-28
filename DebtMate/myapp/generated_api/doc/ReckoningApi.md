# openapi.api.ReckoningApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiReckoningAddNewReckoningPost**](ReckoningApi.md#apireckoningaddnewreckoningpost) | **POST** /api/Reckoning/addNewReckoning | 
[**apiReckoningGetUserDebtsGet**](ReckoningApi.md#apireckoninggetuserdebtsget) | **GET** /api/Reckoning/getUserDebts | 


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

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
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

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

