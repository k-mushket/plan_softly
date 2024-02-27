import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ThemeProvider extends ChangeNotifier {
  Color _themeColor;

  ThemeProvider({required Color initialColor}) : _themeColor = initialColor;

  Color get themeColor => _themeColor;

  Future<void> initAsync() async {
    await _loadThemeColor();
  }

  void setThemeColor(Color color) {
    _themeColor = color;
    notifyListeners();
    _saveThemeColor(color);
  }

  Future<void> _loadThemeColor() async {
    var box = await Hive.openBox('settingsBox');
    int? colorValue = box.get('themeColor');
    if (colorValue != null) {
      _themeColor = Color(colorValue);
      notifyListeners();
    }
  }

  Future<void> _saveThemeColor(Color color) async {
    var box = await Hive.openBox('settingsBox');
    await box.put('themeColor', color.value);
  }
}
