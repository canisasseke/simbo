// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// class SessionStorageService {
//   static SessionStorageService? manager;
//   final _storage = const FlutterSecureStorage();
//   static const String ACCESS_TOKEN_KEY = "ACCESS_TOKEN";
//   static const String REFRESH_TOKEN_KEY = "REFRESH_TOKEN";

//   static Future<SessionStorageService?> getInstance() async {
//     // ignore: prefer_conditional_assignment
//     if (manager == null) {
//       manager = SessionStorageService();
//     }
//     return manager;
//   }

//   void saveAccessToken(String accessToken) async {
//     await _storage.write(key: ACCESS_TOKEN_KEY, value: accessToken);
//   }

//   Future<String?> retriveAccessToken() async {
//     String? accessToken = await _storage.read(key: ACCESS_TOKEN_KEY);
//     if (accessToken == null) {
//       return null;
//     }
//     return accessToken;
//   }

//   void saveRefreshToken(String refreshToken) async {
//     await _storage.write(key: ACCESS_TOKEN_KEY, value: refreshToken);
//   }

//   Future<String?> retriveRefreshToken() async {
//     String? refreshToken = await _storage.read(key: REFRESH_TOKEN_KEY);
//     if (refreshToken == null) {
//       return null;
//     }
//     return refreshToken;
//   }

//   void deleteAllToken() async {
//     await _storage.deleteAll();
//   }
// }

import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'package:simbo_1/model/tokenModel.dart';

class SessionStorageService {
  static SessionStorageService? manager;
  static SharedPreferences? _prefs;
  static const String ACCESS_TOKEN_KEY = "ACCESS_TOKEN";
  static const String REFRESH_TOKEN_KEY = "REFRESH_TOKEN";

  static Future<SessionStorageService?> getInstance() async {
    if (manager == null || _prefs == null) {
      manager = SessionStorageService();
      _prefs = await SharedPreferences.getInstance();
    }
    return manager;
  }

  void saveAccessToken(String accessToken) {
    _prefs?.setString(ACCESS_TOKEN_KEY, accessToken);
  }

  String? retriveAccessToken() {
    var tokenJson = _prefs?.getString(ACCESS_TOKEN_KEY);
    if (tokenJson == null) {
      return null;
    }
    return TokenModel.fromJson(jsonDecode(tokenJson)).accessToken;
  }

  void saveRefreshToken(String refreshToken) {
    _prefs?.setString(REFRESH_TOKEN_KEY, refreshToken);
  }

  String? retriveRefreshToken() {
    var tokenJson = _prefs?.getString(REFRESH_TOKEN_KEY);
    if (tokenJson == null) {
      return null;
    }
    return TokenModel.fromJson(jsonDecode(tokenJson)).refreshToken;
  }
}
