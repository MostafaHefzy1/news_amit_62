import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioHelper {
  static Dio? dio;

  static initDioHelper() {
    dio = Dio(BaseOptions(
        baseUrl: "https://newsapi.org/v2/", receiveDataWhenStatusError: true));
    dio!.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
    ));
  }

  static Future<Response> getData(
      {required String endpoint, Map<String, dynamic>? queryParameters}) async {
    return await dio!.get(endpoint, queryParameters: queryParameters);
  }

  static Future<Response> postData(
      {required String endpoint, Map<String, dynamic>? data}) async {
    return await dio!.post(endpoint, data: data);
  }
}
