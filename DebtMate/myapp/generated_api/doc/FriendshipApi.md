# openapi.api.FriendshipApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiFriendshipAcceptPost**](FriendshipApi.md#apifriendshipacceptpost) | **POST** /api/Friendship/accept | 
[**apiFriendshipAddPost**](FriendshipApi.md#apifriendshipaddpost) | **POST** /api/Friendship/add | 
[**apiFriendshipFriendrequestsUserIdGet**](FriendshipApi.md#apifriendshipfriendrequestsuseridget) | **GET** /api/Friendship/friendrequests/{userId} | 
[**apiFriendshipFriendsUserIdGet**](FriendshipApi.md#apifriendshipfriendsuseridget) | **GET** /api/Friendship/friends/{userId} | 
[**apiFriendshipPendingfriendsUserIdGet**](FriendshipApi.md#apifriendshippendingfriendsuseridget) | **GET** /api/Friendship/pendingfriends/{userId} | 
[**apiFriendshipRemovePost**](FriendshipApi.md#apifriendshipremovepost) | **POST** /api/Friendship/remove | 


# **apiFriendshipAcceptPost**
> AcceptFriendshipResponse apiFriendshipAcceptPost(acceptFriendshipRequest)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getFriendshipApi();
final AcceptFriendshipRequest acceptFriendshipRequest = ; // AcceptFriendshipRequest | 

try {
    final response = api.apiFriendshipAcceptPost(acceptFriendshipRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling FriendshipApi->apiFriendshipAcceptPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **acceptFriendshipRequest** | [**AcceptFriendshipRequest**](AcceptFriendshipRequest.md)|  | [optional] 

### Return type

[**AcceptFriendshipResponse**](AcceptFriendshipResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiFriendshipAddPost**
> AddFriendshipResponse apiFriendshipAddPost(addFriendshipRequest)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getFriendshipApi();
final AddFriendshipRequest addFriendshipRequest = ; // AddFriendshipRequest | 

try {
    final response = api.apiFriendshipAddPost(addFriendshipRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling FriendshipApi->apiFriendshipAddPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **addFriendshipRequest** | [**AddFriendshipRequest**](AddFriendshipRequest.md)|  | [optional] 

### Return type

[**AddFriendshipResponse**](AddFriendshipResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiFriendshipFriendrequestsUserIdGet**
> GetUserFriendRequestsListResponse apiFriendshipFriendrequestsUserIdGet(userId)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getFriendshipApi();
final String userId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    final response = api.apiFriendshipFriendrequestsUserIdGet(userId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling FriendshipApi->apiFriendshipFriendrequestsUserIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **String**|  | 

### Return type

[**GetUserFriendRequestsListResponse**](GetUserFriendRequestsListResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiFriendshipFriendsUserIdGet**
> GetUserFriendListResponse apiFriendshipFriendsUserIdGet(userId)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getFriendshipApi();
final String userId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    final response = api.apiFriendshipFriendsUserIdGet(userId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling FriendshipApi->apiFriendshipFriendsUserIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **String**|  | 

### Return type

[**GetUserFriendListResponse**](GetUserFriendListResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiFriendshipPendingfriendsUserIdGet**
> GetUserPendingFriendListResponse apiFriendshipPendingfriendsUserIdGet(userId)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getFriendshipApi();
final String userId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    final response = api.apiFriendshipPendingfriendsUserIdGet(userId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling FriendshipApi->apiFriendshipPendingfriendsUserIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **String**|  | 

### Return type

[**GetUserPendingFriendListResponse**](GetUserPendingFriendListResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiFriendshipRemovePost**
> RemoveFriendshipResponse apiFriendshipRemovePost(removeFriendshipRequest)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getFriendshipApi();
final RemoveFriendshipRequest removeFriendshipRequest = ; // RemoveFriendshipRequest | 

try {
    final response = api.apiFriendshipRemovePost(removeFriendshipRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling FriendshipApi->apiFriendshipRemovePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **removeFriendshipRequest** | [**RemoveFriendshipRequest**](RemoveFriendshipRequest.md)|  | [optional] 

### Return type

[**RemoveFriendshipResponse**](RemoveFriendshipResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

