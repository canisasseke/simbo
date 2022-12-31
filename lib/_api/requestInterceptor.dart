

import 'package:dio/dio.dart';
import 'package:simbo_1/_services/sessionservice.dart';

class RequestInterceptor extends Interceptor{
  String? accessToken;
   late Future<SessionStorageService?> sessionStorageService;
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {

    options.headers['Authorization'] = 'Bearer $accessToken';
    options.headers['X-TenantID'] = 'mlibmkcom3';
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {

  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {

  }
}