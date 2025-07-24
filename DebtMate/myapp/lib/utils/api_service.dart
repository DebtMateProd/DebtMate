import 'package:dio/dio.dart';
import 'package:myapp/config/api_config.dart';
import 'package:openapi/openapi.dart';

class ApiService {
  ApiService._internal();

  static final ApiService _instance = ApiService._internal();

  static ApiService get instance => _instance;

  String? userId;

  final Dio _dio = Dio(BaseOptions(
    baseUrl: ApiConfig.baseUrl,
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 10),
  ));

  late final Openapi _client = Openapi(
    dio: _dio,
    basePathOverride: ApiConfig.baseUrl,
  );

  late final AuthApi authApi = AuthApi(_client.dio, _client.serializers);
  late final UserApi userApi = UserApi(_client.dio, _client.serializers);
  late final FriendshipApi friendApi = FriendshipApi(_client.dio, _client.serializers);
}
