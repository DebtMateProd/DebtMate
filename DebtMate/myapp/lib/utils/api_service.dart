import 'package:dio/dio.dart';
import 'package:myapp/config/api_config.dart';
import 'package:myapp/models/responses/user_response.dart';
import 'package:openapi/openapi.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  ApiService._internal() {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        if (token != null && token!.isNotEmpty) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        return handler.next(options);
      },
    ));

    _client = Openapi(
      dio: _dio,
      basePathOverride: ApiConfig.baseUrl,
    );

    authApi = AuthApi(_client.dio, _client.serializers);
    userApi = UserApi(_client.dio, _client.serializers);
    friendApi = FriendshipApi(_client.dio, _client.serializers);
    reckoningApi = ReckoningApi(_client.dio, _client.serializers);
    currencyApi = CurrencyApi(_client.dio, _client.serializers);
    receiptApi = ReceiptApi(_client.dio, _client.serializers);
  }

  static final ApiService _instance = ApiService._internal();
  static ApiService get instance => _instance;

  String? userId;
  String? token;

  final Dio _dio = Dio(BaseOptions(
    baseUrl: ApiConfig.baseUrl,
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 10),
  ));

  late final Openapi _client;

  late final AuthApi authApi;
  late final UserApi userApi;
  late final FriendshipApi friendApi;
  late final ReckoningApi reckoningApi;
  late final CurrencyApi currencyApi;
  late final ReceiptApi receiptApi;

  bool _isTokenValid = false;
  UserResp? currentUser;

  Future<bool> init() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final storedToken = prefs.getString('auth_token');
      final storedUserId = prefs.getString('user_id');

      if (storedToken == null || storedToken.isEmpty || storedUserId == null || storedUserId.isEmpty) {
        _isTokenValid = false;
        return false;
      }

      token = storedToken;
      userId = storedUserId;

      try {
        final resp = await userApi.apiUserGetUserGet(userId: userId);
        currentUser = UserResp(userId: resp.data!.user!.userId!, username: resp.data!.user!.userName!);
        _isTokenValid = true;
        return true;

      } catch (e) {
        
        clearToken();
        return false;
      }
    } catch (e) {
      _isTokenValid = false;
      return false;
    }
  }

  bool get isTokenValid => _isTokenValid;

  Future<void> setTokenAndUser(String tokenValue, String userIdValue) async {
    token = tokenValue;
    userId = userIdValue;
    _isTokenValid = true;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', tokenValue);
    await prefs.setString('user_id', userIdValue);
  }

  Future<void> clearToken() async {
    token = null;
    userId = null;
    _isTokenValid = false;
    currentUser = null;
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');
    await prefs.remove('user_id');
  }
}
