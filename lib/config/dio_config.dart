import 'package:dio/dio.dart';

class DioConfig {
  static const String baseUrl =
      'https://backmovilswdos-production.up.railway.app/apiMovil';

  static Dio get dioWithoutAuthorization {
    return Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      sendTimeout: const Duration(seconds: 60),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    ));
  }
}
