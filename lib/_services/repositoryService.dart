// ignore_for_file: prefer_conditional_assignment

import 'package:dio/dio.dart';


class RepositoryService {
  var dio = Dio();

   static RepositoryService? repositoryService;

  static Future<RepositoryService?> getInstance() async {
    if (repositoryService == null) {
      repositoryService = RepositoryService();
    }
    return repositoryService;
  }

  Future<Response?> create(String completeroute, Object body) async {
    return dio.post(
      completeroute,
      data: body,
      options: Options(
        responseType: ResponseType.json,
        headers: {
          Headers.contentTypeHeader: 'JSON',
        },
      ),
    );
  }

  Future<Response?> getData(String completeroute) async {
    return dio.get(
      completeroute,
      options: Options(
        responseType: ResponseType.json,
        headers: {
          Headers.contentTypeHeader: 'JSON',
        },
      ),
    );
  }

  Future<Response?> update(String completeroute, Object body) async {
    return dio.put(
      completeroute,
      data: body,
      options: Options(
        responseType: ResponseType.json,
        headers: {
          Headers.contentTypeHeader: 'JSON',
        },
      ),
    );
  }

  Future<Response?> delete(String completeroute) async {
    return dio.delete(
      completeroute,
      options: Options(
        responseType: ResponseType.json,
        headers: {
          Headers.contentTypeHeader: 'JSON',
        },
      ),
    );
  }

  Future<Future?> getDataBySendingParameterViaRequestBody(
      String completeroute, Object body) async {
    return dio.post(
      completeroute,
      data: body,
      options: Options(
        responseType: ResponseType.json,
        headers: {
          Headers.contentTypeHeader: 'JSON',
        },
      ),
    );
  }

  String createCompleteRoute(String apiHostUrl, String endpoint) {
    return "$apiHostUrl/$endpoint";
  }
}
