import 'package:dio/dio.dart';
import 'package:flutter_dropdown_cleanblc/core/network/endpoints.dart';
import 'package:flutter_dropdown_cleanblc/core/network/network_interceptor.dart';

class DioClient {
  final Dio _dio;
  bool isOverlayLoader;
  bool showSnakbar;

  DioClient(
    this._dio, {
    this.isOverlayLoader = false,
    this.showSnakbar = false,
  }) {
    _dio
      ..options.baseUrl = Endpoints.baseUrl
      ..options.connectTimeout =
          const Duration(milliseconds: Endpoints.connectionTimeout)
      ..options.receiveTimeout =
          const Duration(milliseconds: Endpoints.receiveTimeout)
      ..options.responseType = ResponseType.json
      ..interceptors.addAll(
        [
          NetworkInterceptor(),
        ],
      );
  }

  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
    bool isOverlayLoader = true,
    bool showSnakbar = true,
  }) async {
    final Response response = await _dio.get(
      url,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );

    return response;
  }
}
