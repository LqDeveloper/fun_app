import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fun_app/extensions/context_extensions.dart';
import '../utils/storage_manager.dart';

class ThemeModel with ChangeNotifier {
  static const _themeColorIndexKey = 'ThemeColorIndex';
  static const _themeDarkModeKey = 'ThemeDarkMode';
  static const _themeFontIndexKey = "ThemeFontIndex";
  static const _fontTypeList = ['system', 'iconfont', 'kuaile'];

  ///当前是否是暗黑模式
  bool _isDarkMode = false;

  ///当前主题颜色
  MaterialColor _themeColor = Colors.blue;

  ///当前字体索引
  int _fontIndex = 0;

  ThemeModel() {
    _isDarkMode =
        StorageManager.sharedPreferences.getBool(_themeDarkModeKey) ?? false;
    _themeColor = Colors.primaries[
        StorageManager.sharedPreferences.getInt(_themeColorIndexKey) ?? 0];
    _fontIndex =
        StorageManager.sharedPreferences.getInt(_themeFontIndexKey) ?? 0;
  }

  void switchBrightnessMode(Brightness brightness) {
    _isDarkMode = brightness == Brightness.dark;
    notifyListeners();
    StorageManager.sharedPreferences
        .setBool(_themeDarkModeKey, brightness == Brightness.dark);
  }

  void switchThemeColor(MaterialColor color) {
    _themeColor = color;
    notifyListeners();
    var index = Colors.primaries.indexOf(color);
    StorageManager.sharedPreferences.setInt(_themeColorIndexKey, index);
  }

  void switchFont(int index) {
    _fontIndex = index;
    notifyListeners();
    StorageManager.sharedPreferences.setInt(_themeFontIndexKey, index);
  }

  ThemeData themeData(BuildContext context,
      {bool followSystem = false, bool platformDarkMode: false}) {
    var isDark =
        followSystem ? context.isDarkMode : (_isDarkMode || platformDarkMode);
    var themeColor = isDark ? _themeColor[500] : _themeColor;
    var brightness = isDark ? Brightness.dark : Brightness.light;
    var themeData = ThemeData(
      brightness: brightness,
      primaryColorBrightness: brightness,
      accentColorBrightness: brightness,
      primaryColor: themeColor,
      accentColor: themeColor,
      fontFamily: _fontTypeList[_fontIndex],
      cupertinoOverrideTheme:
          CupertinoThemeData(primaryColor: themeColor, brightness: brightness),
      appBarTheme: AppBarTheme(elevation: 0),
      splashColor: themeColor!.withAlpha(50),
      errorColor: Colors.red,
    );
    return themeData.copyWith(
        chipTheme: themeData.chipTheme.copyWith(
          pressElevation: 0,
          padding: EdgeInsets.symmetric(horizontal: 10),
          labelStyle: themeData.textTheme.caption,
          backgroundColor: themeData.chipTheme.backgroundColor.withOpacity(0.1),
        ),
        inputDecorationTheme: InputDecorationTheme(
          //文本框默认提示信息样式
          hintStyle: TextStyle(fontSize: 14),
          // errorText 存在时未获取焦点边框
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(width: 0.5, color: themeData.errorColor),
          ),
          focusedErrorBorder: UnderlineInputBorder(
              borderSide: BorderSide(width: 0.7, color: themeData.errorColor)),
          // 获取焦点时边框
          focusedBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(width: 0.5, color: themeData.primaryColor)),
          // 可用时边框
          enabledBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(width: 0.5, color: themeData.dividerColor)),
          // 边框
          border: UnderlineInputBorder(
              borderSide:
                  BorderSide(width: 0.5, color: themeData.dividerColor)),
          // 不可用时边框
          disabledBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(width: 0.5, color: themeData.disabledColor)),
        ));
  }
}
