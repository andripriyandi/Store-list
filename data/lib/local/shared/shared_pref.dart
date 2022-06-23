import 'package:dependencies/shared_preferences/shared_preferences.dart';

abstract class StringSharedPreferences {
  static const loginUser = "loginUsers";
}

class SharedPref {
  final SharedPreferences preferences;

  SharedPref({required this.preferences});

  void setPrefLogin(int val) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(StringSharedPreferences.loginUser, val);
  }

  Future<int> getPrefLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int value = prefs.getInt(StringSharedPreferences.loginUser) ?? 0;
    return value;
  }
}
