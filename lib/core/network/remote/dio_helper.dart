import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;
  static void init() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com/',
      receiveDataWhenStatusError: true,
    ));
    print('DioHelper is Initialize');
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
  }) async {
    dio?.options.headers = {
      'Content-Type': 'application/json',
    };

    return dio!.get(url, queryParameters: query);
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
    };
    return dio!.post(url, queryParameters: query, data: data);
  }
}
