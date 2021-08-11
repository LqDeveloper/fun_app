import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fun_app/generated/l10n.dart';
import 'package:fun_app/provider_model/locale_model.dart';
import 'package:fun_app/ui_config/fun_refresh_configuration.dart';
import 'package:fun_app/ui_config/fun_toast.dart';
import 'package:fun_app/utils/app_route.dart';
import 'package:fun_app/utils/provider_manager.dart';
import 'package:fun_app/provider_model/theme_model.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'utils/app_error_handle.dart';

void main() {
  AppErrorHandle.runAppWidge(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FunToast(
        child: MultiProvider(
      providers: ProviderManager.providers,
      child: Consumer2<ThemeModel, LocaleModel>(
        builder: (context, themeModel, localModel, child) {
          return FunRefreshConfiguration(
              child: MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: themeModel.themeData(context),
                  darkTheme:
                      themeModel.themeData(context, platformDarkMode: true),
                  initialRoute: AppRoute.initRoute,
                  onGenerateRoute: AppRoute.generateRoute,
                  locale: localModel.locale,
                  supportedLocales: S.delegate.supportedLocales,
                  localizationsDelegates: [
                S.delegate,
                RefreshLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate
              ]));
        },
      ),
    ));
  }
}
