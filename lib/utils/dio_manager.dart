import 'dart:convert';
import 'dart:io';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fun_app/utils/app_info.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';

class DioManager {
  static DioManager _instance = DioManager._internal();

  static DioManager get instance => _instance;

  late Dio _dio;

  DioManager._internal() {
    _dio = Dio();
    _dio.options.baseUrl = 'https://www.wanandroid.com/';
    _dio.options.responseType = ResponseType.json;
    _dio.options.headers = {'': ''};
    _dio.options.connectTimeout = 5000;
    _dio.options.receiveTimeout = 5000;
    _dio.interceptors.add(LogInterceptor(
        requestHeader: true, requestBody: true, responseBody: true));
    _dio.transformer = JsonTransformer();
  }

  factory DioManager() {
    return _instance;
  }

  init() async {
    var version = await AppInfo.version;
    var headers = {
      'version': {'appVerison': version},
      'platform': Platform.operatingSystem
    };
    _dio.options.headers = headers;

    //将cookie存储在cache文件中
    Directory appDocDir = await getTemporaryDirectory();
    String appDocPath = appDocDir.path;
    var cj = PersistCookieJar(
        ignoreExpires: true, storage: FileStorage(appDocPath + "/.cookies/"));
    _dio.interceptors.add(CookieManager(cj));
  }

  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) {
    return _dio.get(path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress);
  }

  Future<Response<T>> post<T>(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) {
    return _dio.post(path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress);
  }
}

// 必须是顶层函数
_parseAndDecode(String response) {
  return jsonDecode(response);
}

_parseJson(String text) {
  return compute(_parseAndDecode, text);
}

///这个方法转换适合在数据比较大的时候
class JsonTransformer extends DefaultTransformer {
  JsonTransformer() : super(jsonDecodeCallback: _parseJson);
}
