import 'package:base_clean_bloc/base/network/dio/dio_builder.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  @singleton
  Dio get dio => DioBuilder().getDio();
}
