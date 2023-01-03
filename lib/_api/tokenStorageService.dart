
import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:simbo_1/model/tokenModel.dart';

class TokenStorageService{
  // Create storage
   final FlutterSecureStorage _storage;
   static const String TOKEN_KEY = "TOKEN";
   static const String TENANT_KEY = "TENANT_ID";
   TokenStorageService(this._storage);
  void saveToken(String token) async {
    await _storage.write(key: TOKEN_KEY, value: token);
  }
   void saveTenantId(String tenant) async {
     await _storage.write(key: TENANT_KEY, value: tenant);
   }
   Future<String?> retrieveTenant() async {
     String? tenant = await _storage.read(key: TENANT_KEY);
     if (tenant == null) {
       return null;
     }
     return tenant;
   }

  Future<String?> retrieveAccessToken() async {
    String? tokenJson = await _storage.read(key: TOKEN_KEY);
    if (tokenJson == null) {
      return null;
    }
    return TokenModel.fromJson(jsonDecode(tokenJson)).accessToken;
  }

  Future<String?> retrieveRefreshToken() async {
    String? tokenJson = await _storage.read(key: TOKEN_KEY);
    if (tokenJson == null) {
      return null;
    }
    return TokenModel.fromJson(jsonDecode(tokenJson)).refreshToken;
  }

  Future<void> deleteAllToken() async {
    _storage.deleteAll();
  }
  deleteToken(String tokenKey){
    _storage.delete(key: tokenKey);
  }
}