import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../common/config/index.dart';
import '../../../common/logger/index.dart';
import 'dio_interceptor.dart';

class DioBuilder {
  Dio? dio;

  Dio getDio() {
    if (dio == null) {
      final BaseOptions options = BaseOptions(
        baseUrl: getUrl(),
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: ApiConfig.connectTimeout),
        receiveTimeout: const Duration(seconds: ApiConfig.receiveTimeout),
        headers: {"accept": "application/json"},
      );
      dio = Dio(options);
      dio?.options.headers['content-Type'] = 'Application/json';
      dio?.interceptors.addAll(
        [
          PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
            responseHeader: true,
          ),
          DioInterceptor()
        ],
      );
    }
    return dio!;
  }

  String getUrl() {
    return dotenv.get('BASE_URL');
  }
}
