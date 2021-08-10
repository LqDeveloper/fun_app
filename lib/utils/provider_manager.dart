import 'package:fun_app/utils/theme_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class ProviderManager {
  static List<ChangeNotifierProvider> get providers {
    return [_themeProvider];
  }

  static ChangeNotifierProvider get _themeProvider {
    return ChangeNotifierProvider(
        create: (BuildContext context) => ThemeModel());
  }
}
