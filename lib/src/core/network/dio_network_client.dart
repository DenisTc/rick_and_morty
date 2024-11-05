import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/src/core/network/network_client.dart';

@LazySingleton(as: NetworkClient)
final class DioNetworkClient extends NetworkClient {
  static const String _baseUrl = 'https://rickandmortyapi.com/api';

  static final DioNetworkClient _singleton = DioNetworkClient._internal();

  late final Dio _dio;

  DioNetworkClient._internal() {
    _dio = _initializeClient();
  }

  factory DioNetworkClient() => _singleton;

  Dio get client => _dio;

  Dio _initializeClient() {
    return Dio(_baseOptions);
  }

  BaseOptions get _baseOptions {
    const timeout = Duration(seconds: 5);

    return BaseOptions(
      baseUrl: _baseUrl,
      connectTimeout: timeout,
      receiveTimeout: timeout,
      sendTimeout: timeout,
    );
  }

  @override
  Future<Map<String, dynamic>> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await _dio.get(path, queryParameters: queryParameters);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
