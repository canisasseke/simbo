

import 'package:dio/dio.dart';
import 'package:simbo_1/_api/tokenStorageService.dart';
import 'package:simbo_1/di/service_locator.dart';

class RequestInterceptor extends Interceptor{
  String? accessToken;
  String? tenantID;
  final tokenStorageService = locator<TokenStorageService>();
  RequestInterceptor();

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    print('-----------------interceptor-----------------');
    print('REQUEST[${options.method}] => PATH: ${options.path}');
    accessToken =  await tokenStorageService.retrieveAccessToken() ;
    tenantID = await tokenStorageService.retrieveTenant();
    print('-----------------access token retrieved-----------------');
    print(accessToken);
    print('-----------------tenantId retrieved-----------------');
    print(tenantID);
    options.headers['Authorization'] = 'Bearer $accessToken';
    options.headers['X-TenantID'] = '$tenantID';
    return super.onRequest(options, handler);
  }

}