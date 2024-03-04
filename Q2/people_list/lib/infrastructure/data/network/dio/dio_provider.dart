import 'package:dio/dio.dart';

class DioProvider {
  static Dio provideDio() {
    final dio = Dio();

    dio
      ..options.headers = {'Context-Type': 'application/json; charset=utf-8'}
      ..options.connectTimeout = Duration(
        // milliseconds: int.parse(Envs.connectTimeout),
        milliseconds: 15000,
      )
      ..options.receiveTimeout = Duration(
        // milliseconds: int.parse(Envs.receiveTimeout),
        milliseconds: 15000,
      )
      ..interceptors.add(
        LogInterceptor(
          request: true,
          responseBody: true,
          requestBody: true,
          requestHeader: true,
        ),
      );

    return dio;
  }
}
