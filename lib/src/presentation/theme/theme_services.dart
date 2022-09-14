import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ringtones_flutter/src/data/repository/local/services/local_storage.dart';
import 'package:ringtones_flutter/src/domain/contants/global_constants.dart';

class ThemeServices {
  ThemeServices();

  ThemeMode get theme => _loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;

  bool _loadThemeFromBox() => isDarKPreferences();

  bool isDarKPreferences() {
    bool value = LocalStorage.prefs.getBool(themeStyle) ?? false;
    if (value) {
      return LocalStorage.prefs.getBool(themeStyle) ?? false;
    } else {
      LocalStorage.prefs.setBool(themeStyle, false);
      return false;
    }
  }

  _saveThemeToBox(bool isDarkMode) =>
      LocalStorage.prefs.setBool(themeStyle, isDarkMode);

  void switchTheme() {
    Get.changeThemeMode(_loadThemeFromBox() ? ThemeMode.light : ThemeMode.dark);
    bool val = LocalStorage.prefs.getBool(themeStyle) ?? false;
    _saveThemeToBox(
      val ? false : true,
    );
  }

  Future<bool> isDarkMode() async {
    return _loadThemeFromBox();
  }

  void clearTheme() {
    LocalStorage.prefs.setBool(themeStyle, false);
  }
}
