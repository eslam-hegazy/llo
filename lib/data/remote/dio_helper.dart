import 'package:dio/dio.dart';
import 'package:magdsoft_flutter_structure/constants/end_points.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseURL,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    required Map<String, dynamic> query,
    required Map<String, String> data,
  }) async {
    return await dio!.get(url, queryParameters: query);
  }

  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> body,
  }) async {
    dio!.options.headers = {
      "Accept": "application/json",
    };
    return await dio!.post(url, data: body);
  }
}
