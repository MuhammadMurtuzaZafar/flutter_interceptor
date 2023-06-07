import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_interceptor/network/rest_constant.dart';

import '../interceptors/custom_interceptor.dart';

class ApiClient
{
  static final ApiClient _converter=ApiClient._internal();
  static const String kRequiredHeader = 'Header';
  static const String kAuthorization = 'Authorization';

  ApiClient._internal();

  factory ApiClient()
  {
    return _converter;
  }

  Dio dio() {
    Dio dio = Dio(
        BaseOptions(
            connectTimeout: const Duration(milliseconds: 10000),
            receiveTimeout: const Duration(milliseconds: 10000),
            baseUrl: RestConstant.kStageBaseUrl

        )
    );

    if(kDebugMode)
    {
      dio.interceptors.add(LogInterceptor(
        request: true,
        error: true,
        requestHeader: true,
        requestBody: true
      ));

    }
    dio.interceptors.add(CustomInterceptor());

    return dio;

  }
}