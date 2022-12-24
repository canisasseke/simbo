// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:simbo_1/_services/apiPath.dart';
import 'package:simbo_1/_services/sessionservice.dart';

class AuthService {
  var dio = Dio();
  static AuthService? authService;

  static Future<AuthService?> getInstance() async {
    if (authService == null) {
      authService = AuthService();
    }
    return authService;
  }

  Future<int?> authenticateUser(String username, String password) async {
    var res = await dio.post(
      'https://auth.simbo.me/auth/realms/mlibmkcom3/protocol/openid-connect/token',
      data: {
        "username": username,
        "password": password,
        "client_id": "simbowebfrontend",
        "grant_type": "password",
        "scope": "email openid profile"
      },
      options: Options(
        //responseType: ResponseType.json,
        headers: {
          Headers.contentTypeHeader: Headers.formUrlEncodedContentType,
        },
      ),
    );

    if (res.statusCode == 200) {
      var sessionStorageService = await SessionStorageService.getInstance();
      sessionStorageService?.saveAccessToken(res.data.toString());
      print(res.data);
      return res.statusCode;
    } else {
      debugPrint(
          "An Error Occurred during loggin in. Status code: ${res.statusCode} , body: ${res.data.toString()}");
      return res.statusCode;
    }
  }
}
