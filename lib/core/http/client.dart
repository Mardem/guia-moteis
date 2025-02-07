import 'package:dio/dio.dart';

import '../constants/url.dart';

abstract interface class HttpClient {
  Future<Response<T>> get<T>(
    String path, {
    String baseUrl,
    Map<String, dynamic>? queryParameters,
    Options? options,
  });
}

class HttpClientImpl implements HttpClient {
  HttpClientImpl() : _client = Dio();

  final Dio _client;

  @override
  Future<Response<T>> get<T>(
    String path, {
    String baseUrl = UrlConstants.baseUrl,
    Map<String, dynamic>? queryParameters,
    Options? options,
    ProgressCallback? onReceiveProgress,
  }) async {
    return _client.get<T>(
      path,
      queryParameters: queryParameters,
      options: options,
      onReceiveProgress: onReceiveProgress,
    );
  }
}
