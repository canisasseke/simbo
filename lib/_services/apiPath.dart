// ignore_for_file: file_names, non_constant_identifier_names, prefer_const_declarations, prefer_conditional_assignment

class ApiPath {
  // static final baseKeycloakUrl =
  //     FlavorConfig.instance.variables["baseKeycloakUrl"];
  // static final baseApiUrl = FlavorConfig.instance.variables["baseApiUrl"];

  static ApiPath? apiPath;

  static Future<ApiPath?> getInstance() async {
    if (apiPath == null) {
      apiPath = ApiPath();
    }
    return apiPath;
  }

  static final String KEYCLOAK_AUTH =
      'https://auth.simbo.me/auth/realms/mlibmkcom3/protocol/openid-connect/token';
  static final String API_SIMBOWEB_HOST_URL =
      'https://web.simbo.me/api/simboweb';
}
