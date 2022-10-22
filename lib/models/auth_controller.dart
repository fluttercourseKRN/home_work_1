import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  AuthController._internal();

  static late final SharedPreferences prefs;
  static const _loginPrefKey = '_loginKey';
  static const _login = 'admin';
  static const _password = '123456';

  static initialize() async {
    prefs = await SharedPreferences.getInstance();
  }

  static set _isLogin(bool setLogin) => prefs.setBool(_loginPrefKey, setLogin);

  static bool get isLogin => prefs.getBool(_loginPrefKey) ?? false;

  static void logout() => _isLogin = false;
  static bool login({
    required String login,
    required String password,
    bool saveLoginState = false,
  }) {
    if (_login == login && _password == password) {
      if (saveLoginState) _isLogin = true;
      return true;
    }
    return false;
  }
}
