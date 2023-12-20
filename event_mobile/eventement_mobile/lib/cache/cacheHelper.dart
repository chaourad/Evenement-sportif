import 'package:shared_preferences/shared_preferences.dart';

class CacheData {
  static late SharedPreferences sharedPreferences;

  // Initialize sharedPreferences
  static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  //1 - set data
  static Future<bool> setData(
      {required String key, required dynamic value}) async {
    if (sharedPreferences == null) {
      await init();
    }

    if (value is int) {
      await sharedPreferences.setInt(key, value);
      return true;
    }
    if (value is String) {
      await sharedPreferences.setString(key, value);
      return true;
    }
    if (value is double) {
      await sharedPreferences.setDouble(key, value);
      return true;
    }
    return false;
  }

  //2 - Get data => key
  static dynamic getData({required String key}) {
    if (sharedPreferences == null) {
      return null; // or handle the case appropriately
    }
    return sharedPreferences.get(key);
  }

  //3 - delete
  static void deleteItem({required String key}) {
    if (sharedPreferences != null) {
      sharedPreferences.remove(key);
    }
  }

  //4 - delete all item
  static void deleteData() {
    if (sharedPreferences != null) {
      sharedPreferences.clear();
    }
  }
}
