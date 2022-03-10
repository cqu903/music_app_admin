import 'package:dio/dio.dart';
import 'package:music_app_admin/api/api_constants.dart';
import 'package:music_app_admin/secure/secure_context.dart';
import 'package:music_app_admin/utils/log_util.dart';

class DioUtils {
  /// global dio object
  static Dio? dio;

  /// default options
  static const int connectionTimeout = 10000;
  static const int receiveTimeout = 3000;

  /// http request methods
  static const String get = 'get';
  static const String post = 'post';
  static const String put = 'put';
  static const String delete = 'delete';

  /// 创建 dio 实例对象
  static Future<Dio> createInstance() async {
    if (dio == null) {
      var headers = genHeaders();

      /// 全局属性：请求前缀、连接超时时间、响应超时时间
      var options = BaseOptions(
          connectTimeout: 350000,
          receiveTimeout: 150000,
          responseType: ResponseType.json,
          validateStatus: (status) {
            // 不使用http状态码判断状态，使用AdapterInterceptor来处理（适用于标准REST风格）
            return true;
          },
          baseUrl: baseUrl,
          headers: headers);

      dio = Dio(options);
    }

    return dio!;
  }

  static genHeaders() {
    dynamic headers = {
      'Accept': 'application/json,*/*',
      'Content-Type': 'application/json',
    };
    if (SecureContext.secureContext != null) {
      headers['Authorization'] = SecureContext.secureContext!.token;
    }
    return headers;
  }

  /// 清空 dio 对象
  static clear() {
    dio = null;
  }

  ///Get请求
  static dynamic getHttp<T>(
    String url, {
    parameters,
  }) async {
    try {
      Dio dios = await createInstance();
      Response response;
      response = await dios.get(
        url,
        queryParameters: parameters,
        options: Options(headers: genHeaders()),
      ); //cancelToken: token
      var responseData = response.data;
      if (response.statusCode == 200) {
        return response.data;
      } else {
        logger().severe(
            "error code is:${response.statusCode},error message is ${response.statusMessage}");
      }
    } catch (e) {
      logger().severe(e.toString());
    }
  }

  ///Post请求
  static dynamic postHttp<T>(
    String url, {
    parameters,
  }) async {
    try {
      Dio dios = await createInstance();
      Response response = await dios.post(
        url,
        data: parameters,
        options: Options(headers: genHeaders()),
      );
      if (response.statusCode == 200) {
        return response.data;
      } else {
        logger().severe(
            "error:${response.statusCode},error message is ${response.statusMessage}");
      }
    } catch (e) {
      logger().severe(e.toString());
    }
  }

  static void putHttp<T>(
    String url, {
    parameters,
    required Function(T) onSuccess,
    required Function(String error) onError,
  }) async {}

  static void deleteHttp<T>(
    String url, {
    parameters,
    required Function(T) onSuccess,
    required Function(String error) onError,
  }) async {}

  /// request Get、Post 请求
//url 请求链接
//parameters 请求参数
//method 请求方式
//onSuccess 成功回调
//onError 失败回调
  static void requestHttp(String url,
      {parameters,
      method,
      required Function(dynamic t) onSuccess,
      required Function(String error) onError}) async {
    parameters = parameters ?? {};
    method = method ?? 'GET';

    if (method == DioUtils.get) {
      getHttp(
        url,
        parameters: parameters,
      );
    } else if (method == DioUtils.post) {
      postHttp(
        url,
        parameters: parameters,
      );
    } else if (method == DioUtils.put) {
      putHttp(
        url,
        parameters: parameters,
        onSuccess: (data) {
          onSuccess(data);
        },
        onError: (error) {
          onError(error);
        },
      );
    } else if (method == DioUtils.delete) {
      deleteHttp(
        url,
        parameters: parameters,
        onSuccess: (data) {
          onSuccess(data);
        },
        onError: (error) {
          onError(error);
        },
      );
    }
  }
}
