import 'package:dio/dio.dart';
import 'package:productive_families/constants/constant_methods.dart';
import 'package:productive_families/constants/constants.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://504-merge.magdsofteg.xyz/api/',
      receiveDataWhenStatusError: true,
      connectTimeout: 30*1000

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
    bool formData=false,
    String? token,
  }) {
    dio.options.headers = {
      'Authorization': token ?? ''
    };

    data == null? data={'language':AppLang}:  data['language'] = AppLang;

    printResponse('base:    ' + dio.options.baseUrl.toString());
    printResponse('url:    ' + url.toString());
    printResponse('header:    ' + dio.options.headers.toString());
    printResponse('body:    ' + data.toString());
    return dio.post(

      url,
      queryParameters: query,
      data:formData? FormData.fromMap(data):data,
    );
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
