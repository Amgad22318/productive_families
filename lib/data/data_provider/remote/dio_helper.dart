import 'package:dio/dio.dart';
import 'package:productive_families/constants/constant_methods.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://504-test.magdsofteg.xyz/api/',
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'ar',
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token ?? ''
    };
    return await dio.get(url, queryParameters: query);
  }




  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
     Map<String, dynamic>? data,
  }) {
    dio.options.headers = {
      'Content-Type': 'application/json',
    };

    data={'language':'ar'};
    printResponse('body:    '+data.toString());
    printResponse('header:    '+dio.options.headers.toString());
    printResponse('url:    '+url.toString());
    return dio.post(url, queryParameters: query, data: data,);
  }






  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic>? data,
    String lang = 'ar',
    String? token,
  }) {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token ?? ''
    };
    return dio.put(url, queryParameters: query, data: data);
  }

}
