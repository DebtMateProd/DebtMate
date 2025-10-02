# openapi.api.UserApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiUserGetAllUsersGet**](UserApi.md#apiusergetallusersget) | **GET** /api/User/getAllUsers | 
[**apiUserGetUserGet**](UserApi.md#apiusergetuserget) | **GET** /api/User/getUser | 
[**apiUserUpdateUserPost**](UserApi.md#apiuserupdateuserpost) | **POST** /api/User/updateUser | 


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

# **apiUserGetUserGet**
> GetUserResponse apiUserGetUserGet(userId, includeLogin)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getUserApi();
final String userId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final bool includeLogin = true; // bool | 

try {
    final response = api.apiUserGetUserGet(userId, includeLogin);
    print(response);
} catch on DioException (e) {
    print('Exception when calling UserApi->apiUserGetUserGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **String**|  | [optional] 
 **includeLogin** | **bool**|  | [optional] [default to false]

### Return type

[**GetUserResponse**](GetUserResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiUserUpdateUserPost**
> UpdateUserResponse apiUserUpdateUserPost(updateUserRequest)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getUserApi();
final UpdateUserRequest updateUserRequest = ; // UpdateUserRequest | 

try {
    final response = api.apiUserUpdateUserPost(updateUserRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling UserApi->apiUserUpdateUserPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **updateUserRequest** | [**UpdateUserRequest**](UpdateUserRequest.md)|  | [optional] 

### Return type

[**UpdateUserResponse**](UpdateUserResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

