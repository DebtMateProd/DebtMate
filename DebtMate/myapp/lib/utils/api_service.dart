import 'package:dio/dio.dart';
import 'package:myapp/config/api_config.dart';
import 'package:openapi/openapi.dart';

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
      basePathOverride: ApiConfig.serverUrl,
    );

    authApi = AuthApi(_client.dio, _client.serializers);
    userApi = UserApi(_client.dio, _client.serializers);
    friendApi = FriendshipApi(_client.dio, _client.serializers);
    reckoningApi = ReckoningApi(_client.dio, _client.serializers);
    currencyApi = CurrencyApi(_client.dio, _client.serializers);
  }

  static final ApiService _instance = ApiService._internal();
  static ApiService get instance => _instance;

  String? userId;
  String? token;

  final Dio _dio = Dio(BaseOptions(
    baseUrl: ApiConfig.serverUrl,
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 10),
  ));

  late final Openapi _client;

  late final AuthApi authApi;
  late final UserApi userApi;
  late final FriendshipApi friendApi;
  late final ReckoningApi reckoningApi;
  late final CurrencyApi currencyApi;
}
