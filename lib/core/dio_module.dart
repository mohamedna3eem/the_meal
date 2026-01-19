import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  @preResolve
  Future<Dio> dio() async {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://www.themealdb.com/api/json/v1/1/',
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        sendTimeout: const Duration(seconds: 15),
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );

    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,

        // logPrint: (object) {
        //   print('mo naeem');
        // },
      ),
    );

    return dio;
  }
}
