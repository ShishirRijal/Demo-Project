import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static const String _nameKey = 'user_name';
  static const String _counterKey = 'counter_value';

  static Future<void> saveName(String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_nameKey, name);
  }

  static Future<String?> getName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_nameKey);
  }

  static Future<void> saveCounter(int count) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_counterKey, count);
  }

  static Future<int> getCounter() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_counterKey) ?? 0; // Default to 0 if no value is found
  }

  static Future<void> clearData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_nameKey);
    await prefs.remove(_counterKey);
  }
}
