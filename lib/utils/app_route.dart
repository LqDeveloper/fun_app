import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fun_app/ui/main_widget.dart';
import 'package:fun_app/ui/splash_widget.dart';
import 'package:fun_app/utils/page_route_anim.dart';

class AppRouterUrl {
  static const main = 'MainView';
  static const splash = 'Splash';
}

class AppRoute {
  static const initRoute = AppRouterUrl.splash;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouterUrl.splash:
        return NoAnimRouteBuilder(SplashWidget());
      case AppRouterUrl.main:
        return NoAnimRouteBuilder(MainWidget());
      default:
        return CupertinoPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('没有定义这个路由 ${settings.name}'),
                  ),
                ));
    }
  }
}
