import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static const String token = "token";

  static Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get(token);
  }

  static Future setToken(String tok) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(token, 'Token $tok');
  }
}
