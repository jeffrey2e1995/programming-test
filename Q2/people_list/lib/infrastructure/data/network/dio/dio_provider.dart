import 'package:dio/dio.dart';
import 'package:people_list/utils/constants/env.dart';

class DioProvider {
  static Dio provideDio() {
    final dio = Dio();

    dio
      ..options.headers = {'Context-Type': 'application/json; charset=utf-8'}
      ..options.connectTimeout = Duration(
        milliseconds: int.parse(Envs.connectTimeout),
      )
      ..options.receiveTimeout = Duration(
        milliseconds: int.parse(Envs.receiveTimeout),
      )
      ..options.baseUrl = Envs.apiBaseUrl
      ..options.headers['Authorization'] = 'Bearer ${Envs.apiGetListToken}'
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
