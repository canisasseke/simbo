
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:simbo_1/_api/tokenStorageService.dart';

class AuthService{
  final TokenStorageService _tokenStorageService;

  AuthService(this._tokenStorageService);
  Future<int> authenticateUser(String username, String password) async {
    var res = await http.post(Uri.parse(
        'https://auth.simbo.me/auth/realms/mlibmkcom3/protocol/openid-connect/token'),
        headers: {
          "Content-Type": "application/x-www-form-urlencoded"
        }, body: {
          "username": username,
          "password": password,
          "client_id": "simbowebfrontend",
          "grant_type": "password",
          "scope": "email openid profile"
        });
    print(http.BaseRequest);
    if (res.statusCode == 200) {
     // var sessionStorageService = await SessionStorageService.getInstance();
      _tokenStorageService.saveToken(res.body);
      print(res.body);
      print('--------------access-------------------');
      print(await _tokenStorageService.retrieveAccessToken());
      print('-----------refresh----------------------');
      print( await _tokenStorageService.retrieveRefreshToken());
      return res.statusCode;
    } else {
      debugPrint(
          "An Error Occurred during loggin in. Status code: ${res.statusCode} , body: ${res.body}");
      return res.statusCode;
    }
  }
}