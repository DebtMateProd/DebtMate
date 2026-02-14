# openapi.api.ReceiptApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiReceiptAnalyzePost**](ReceiptApi.md#apireceiptanalyzepost) | **POST** /api/Receipt/analyze | 


# **apiReceiptAnalyzePost**
> AnalyzeReceiptResponse apiReceiptAnalyzePost(file)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getReceiptApi();
final MultipartFile file = BINARY_DATA_HERE; // MultipartFile | 

try {
    final response = api.apiReceiptAnalyzePost(file);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ReceiptApi->apiReceiptAnalyzePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **file** | **MultipartFile**|  | [optional] 

### Return type

[**AnalyzeReceiptResponse**](AnalyzeReceiptResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

