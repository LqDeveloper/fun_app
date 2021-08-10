import 'package:flutter/material.dart';
import 'package:fun_app/utils/app_route.dart';
import 'package:fun_app/utils/provider_manager.dart';
import 'package:fun_app/utils/theme_model.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';
import 'utils/app_error_handle.dart';

void main() {
  AppErrorHandle.runAppWidge(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OKToast(
        child: MultiProvider(
      providers: ProviderManager.providers,
      child: Consumer<ThemeModel>(
        builder: (context, themeModel, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: themeModel.themeData(context),
            darkTheme: themeModel.themeData(context, platformDarkMode: true),
            initialRoute: AppRoute.initRoute,
            onGenerateRoute: AppRoute.generateRoute,
          );
        },
      ),
    ));
  }
}
