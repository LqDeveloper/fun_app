import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fun_app/utils/logger_utils.dart';

import '';

class AppErrorHandle {
  static void runAppWidge(Widget app) {
    runZonedGuarded(() {
      WidgetsFlutterBinding.ensureInitialized();
      FlutterError.onError = (FlutterErrorDetails details) {
        _handleError("Flutter导致的错误", details.exception, details.stack);
      };
      runApp(app);
    }, (Object error, StackTrace stack) {
      _handleError("未被 Flutter 捕获的错误", error, stack);
    });
  }

  static void _handleError(String message, Object? error, StackTrace? stack) {
    LoggerUtils.e(message, error, stack);
    ErrorWidget.builder = (FlutterErrorDetails details) {
      return Container(
        color: Colors.green,
        child: Text(
          'message:$message exception:$error stack:$stack',
          style: TextStyle(color: Colors.red),
        ),
      );
    };
  }
}
