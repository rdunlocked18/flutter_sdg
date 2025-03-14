import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_dropdown_cleanblc/core/network/endpoints.dart';
import 'package:flutter_dropdown_cleanblc/core/resources/app_constants.dart';

import 'network_connection_checker.dart';

class NetworkInterceptor extends Interceptor {
  NetworkInterceptor();

  @override
  FutureOr<dynamic> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (await NetworkConnectionChecker.isConnected()) {
      options.headers.addAll(
        {
          Endpoints.header: dotenv.env[AppConstants.dotEnvApiKey],
        },
      );

      super.onRequest(options, handler);
    } else {
      handler.reject(
        DioException(requestOptions: options, message: 'No Connection'),
      );
    }
  }

  @override
  FutureOr<dynamic> onResponse(
      Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
  }

  @override
  Future<dynamic> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    super.onError(err, handler);

    try {
      debugPrint('Error occured: ${err.message}');
    } catch (e) {
      debugPrint(e.toString());
    }

    return handler.next;
  }

  Future<Response<dynamic>> retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return Dio().request<dynamic>(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }
}
