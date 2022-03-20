import 'package:productive_families/constants/constant_methods.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static dynamic getDataFromSP({required String key}) {
    return sharedPreferences.get(key);
  }

  static Future<bool> saveDataToSP(
      {required String key, required dynamic value}) async {
    if (value is bool) {
     // printTest(value.toString());
      return await sharedPreferences.setBool(key, value);
    } else if (value is String) {
     // printTest(value.toString());

      return await sharedPreferences.setString(key, value);
    } else if (value is int) {
     // printTest(value.toString());

      return await sharedPreferences.setInt(key, value);
    } else {
      value ??= 0.0;
     // printTest(value.toString());
      return await sharedPreferences.setDouble(key, value);
    }
  }

  static Future<bool> removeDataFromSP({required String key}) async {
    return await sharedPreferences.remove(key);
  }
}
