import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static Future<SharedPreferences> getSharedPreferencesInstance() async {
    return await SharedPreferences.getInstance();
  }
}
