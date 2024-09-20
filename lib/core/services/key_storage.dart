import 'package:shared_preferences/shared_preferences.dart';

class SessionIdStorage {
  static late SharedPreferences _prefs;

  static Future initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  String get lastSessionId {
    // print('Getting ID');
    return _prefs.getString('sessionId') ?? '';
  }

  set lastSessionId(String id) {
    // print('Saving ID');
    _prefs.setString('sessionId', id);
  }

  set removeSessionId(String key) {
    // print('Removing ID');
    _prefs.remove(key);
  }
}
