import 'package:shared_preferences/shared_preferences.dart';
import 'package:localstore/localstore.dart';

class LocalPreferencesStorage {
  static late SharedPreferences prefs;
  static late Localstore storeFavs;

  static Future<void> configurePrefs() async {
    prefs = await SharedPreferences.getInstance();
    storeFavs = Localstore.instance;
  }
}
