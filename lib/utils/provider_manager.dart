import 'package:fun_app/provider_model/bottom_nav_model.dart';
import 'package:fun_app/provider_model/locale_model.dart';
import 'package:fun_app/provider_model/theme_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/single_child_widget.dart';

class ProviderManager {
  static List<SingleChildWidget> providers = [...independentServices];

  static List<SingleChildWidget> independentServices = [
    ChangeNotifierProvider<ThemeModel>(
        create: (BuildContext context) => ThemeModel()),
    ChangeNotifierProvider<LocaleModel>(
        create: (BuildContext context) => LocaleModel()),
    ChangeNotifierProvider(create: (BuildContext context) => BottomNavModel())
  ];
}
