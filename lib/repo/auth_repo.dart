import 'package:homeward/network/api_client.dart';
import 'package:homeward/network/api_endpoints.dart';

class AuthRepo {
  static Future login(String email, String password) async {
    var response = await apiClient.post(Api.login, {
      'email': email,
      'password': password,
    });
    return response;
  }
}
