import 'package:dio/dio.dart';

class Services {
  static Dio? _dio;

  static const String _baseUrl = 'https://fakestoreapi.com/';

  Services._internal() {
    // ignore: prefer_conditional_assignment, unnecessary_null_comparison
    if (_dio == null) {
      _dio = Dio(
        BaseOptions(
          baseUrl: _baseUrl,
          connectTimeout: 5000,
          receiveTimeout: 3000,
        ),
      );
    }
  }

  factory Services() => Services._internal();

  Future<dynamic> get({required String url}) async {
    try {
      final Response response = await _dio!.get(url);
      return response.data;
    } on DioError catch (e) {
      return e.response?.data ?? e.message;
    }
  }
}
