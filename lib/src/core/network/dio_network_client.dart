import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/src/core/network/app_exception.dart';
import 'package:rick_and_morty/src/core/network/network_client.dart';

@LazySingleton(as: NetworkClient)
final class DioNetworkClient extends NetworkClient {
  static const String _baseUrl = 'https://rickandmortyapi.com/api';

  late final Dio _dio = _createClient();

  Dio _createClient() {
    const timeout = Duration(seconds: 5);

    return Dio(
      BaseOptions(
        baseUrl: _baseUrl,
        connectTimeout: timeout,
        receiveTimeout: timeout,
        sendTimeout: timeout,
      ),
    );
  }

  @override
  Future<Map<String, dynamic>> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.get(path, queryParameters: queryParameters);
      if (response.statusCode == 200) {
        return response.data;
      }
      throw ServerException(response.statusCode, response.statusMessage);
    } on DioException catch (e) {
      throw AppException.fromDioException(e);
    }
  }
}
