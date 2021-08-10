import 'package:fun_app/provider_model/locale_model.dart';
import 'package:fun_app/provider_model/theme_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class ProviderManager {
  static List<ChangeNotifierProvider> get providers {
    return [_themeProvider,_localeProvider];
  }

  static ChangeNotifierProvider get _themeProvider {
    return ChangeNotifierProvider(
        create: (BuildContext context) => ThemeModel());
  }

  static ChangeNotifierProvider get _localeProvider {
    return ChangeNotifierProvider(
        create: (BuildContext context) => LocaleModel());
  }
}
