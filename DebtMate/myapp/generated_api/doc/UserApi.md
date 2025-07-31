# openapi.api.UserApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiUserGetAllUsersGet**](UserApi.md#apiusergetallusersget) | **GET** /api/User/getAllUsers | 


# **apiUserGetAllUsersGet**
> GetAllResponse apiUserGetAllUsersGet()



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getUserApi();

try {
    final response = api.apiUserGetAllUsersGet();
    print(response);
} catch on DioException (e) {
    print('Exception when calling UserApi->apiUserGetAllUsersGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**GetAllResponse**](GetAllResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

