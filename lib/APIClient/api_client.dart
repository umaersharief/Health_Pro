import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:health_pro/utils/app_constant.dart';
import 'package:health_pro/utils/app_urls.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class APIClient {
  // late final prefs =  SharedPreferences.getInstance();
  Dio _dio = Dio();
  Map<String, dynamic> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer ${AppConstant.getUserToken}'
  };

  APIClient() {
    BaseOptions baseOptions = BaseOptions(
      receiveTimeout: const Duration(seconds: 30),
      connectTimeout: const Duration(seconds: 30),
      baseUrl: AppUrls.baseUrl,
      maxRedirects: 2,
    );
    _dio = Dio(baseOptions);
    _dio.interceptors.add(LogInterceptor(
      requestBody: true,
      error: true,
      request: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
    ));
  }

  /// for Get request.
  Future<Response> get({
    required String url,
  }) async {
    Response response;
    try {
      response = await _dio.get(url,
          options: Options(responseType: ResponseType.json, headers: headers));
    } on DioException catch (exception) {
      String content = exception.response.toString();
      rethrow;
    }
    return response;
  }

  /// for Post request.
  Future<Response> post({required String url, var params}) async {
    Response response;
    print('url of the method : ${url}');
    try {
      response = await _dio.post(url,
          data: params,
          options: Options(responseType: ResponseType.json, headers: headers));
      print('response of card registration: $response');
    } on DioException catch (exception) {
      print(
          'exception ------------------exception-------------------- ${exception.toString()}');
      if (exception.response != null) {
        String content = exception.response.toString();
        Map<String, dynamic> map = jsonDecode(exception.response.toString());
        if (map['message'] != null) {
          print('error_______${content}_________error');
          AppConstant.showCustomSnackBar(map['message'].toString(),
              isError: true);
        } else if (map['errors'] != null) {
          print('error_______${map['message'].toString()}_________error');
          AppConstant.showCustomSnackBar(map['errors'].toString(),
              isError: true);
        } else {
          AppConstant.showCustomSnackBar(map['error'].toString(),
              isError: true);
        }

        // AppConstant.flutterToastError(message: map['message']);
        print("this is error in dio message  ${map['message'].toString()}");
        print("this is error in dio error  ${map['error'].toString()}");
        print("this is error in dio errorss  ${map['errors'].toString()}");
      }
      rethrow;
    }
    return response;
  }

  /// for delete request
  Future<Response> delete({required String url, var params}) async {
    Response response;
    try {
      response = await _dio.delete(url,
          data: params,
          options: Options(responseType: ResponseType.json, headers: headers));
    } on DioException catch (exception) {
      String content = exception.response.toString();
      rethrow;
    }
    return response;
  }

  /// for Put Request.
  Future<Response> put({required String url, var params}) async {
    Response response;
    try {
      response = await _dio.put(url,
          data: params,
          options: Options(
            responseType: ResponseType.json,
          ));
    } on DioException catch (exception) {
      String content = exception.response.toString();
      if (exception.response != null) {
        print("this si status code ${exception.response!.statusCode}");
        Map<String, dynamic> map = exception.response!.data;
        AppConstant.flutterToastError(message: map['message']);
      }
      rethrow;
    }
    return response;
  }

//   // for download Request.
//   Future<Response> download(String url, String pathName, void Function(int, int)? onReceiveProgress) async {
//  //   logger.i("${AppConstant.getUserToken}this is my user token");
//     Response response;
//     try {
//       response = await _dio.download(
//         url,
//         pathName,
//         onReceiveProgress: onReceiveProgress,
//       );
//     } on DioException catch (exception) {
//       String content = exception.response.toString();
//       // AppConstant.logger
//       //     .e("this is error in dio api client : ${content.toString()}");
//       rethrow;
//     }
//     return response;
//   }
}
