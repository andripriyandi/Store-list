import 'package:dependencies/shared_preferences/shared_preferences.dart';

abstract class StringSharedPreferences {
  static const onBoarding = "onboardingCache";
  static const skipLogin = "skipLogin";
  static const tokenUser = "tokenUser";
  static const loginUser = "loginUsers";
  static const userData = "userData";
  static const languageData = "languageData";
  static const userId = "userId";
}

class SharedPref {
  final SharedPreferences preferences;

  SharedPref({required this.preferences});

  void setPrefSkipLogin(bool val) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(StringSharedPreferences.skipLogin, val);
  }

  Future<bool> getPrefSkipLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool value = prefs.getBool(StringSharedPreferences.skipLogin) ?? false;
    return value;
  }

  void setPrefOnBoarding(bool val) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(StringSharedPreferences.onBoarding, val);
  }

  Future<bool> getPrefOnBoarding() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool value = prefs.getBool(StringSharedPreferences.onBoarding) ?? false;
    return value;
  }

  void setPrefLanguage(String language) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(StringSharedPreferences.languageData, language);
  }

  Future<String> getPrefLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String value = prefs.getString(StringSharedPreferences.languageData) ?? "";
    return value;
  }

  void setPrefLogin(int val) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(StringSharedPreferences.loginUser, val);
  }

  Future<int> getPrefLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int value = prefs.getInt(StringSharedPreferences.loginUser) ?? 0;
    return value;
  }

  void setUserData(String val) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(StringSharedPreferences.userData, val);
  }

  Future<String> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String value = prefs.getString(StringSharedPreferences.userData) ?? "";
    return value;
  }

  void setTokenUser(String val) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(StringSharedPreferences.tokenUser, val);
  }

  Future<String> getTokenUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String value = prefs.getString(StringSharedPreferences.tokenUser) ?? "";
    return value;
  }

  Future<bool> deleteUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(StringSharedPreferences.loginUser);
    return true;
  }

  void setUserId(int val) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(StringSharedPreferences.userId, val);
  }

  Future<int> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int value = prefs.getInt(StringSharedPreferences.userId) ?? 0;
    return value;
  }
}
