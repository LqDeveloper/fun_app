import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fun_app/utils/storage_manager.dart';

import 'logger_utils.dart';

///处理所有类型的错误
class AppErrorHandle {
  static runAppWidge(Widget app) {
    runZonedGuarded(() async {
      WidgetsFlutterBinding.ensureInitialized();
      await StorageManager.init();
      FlutterError.onError = (FlutterErrorDetails details) {
        _handleError("Flutter 捕获的错误", details.exception, details.stack);
      };
      runApp(app);
    }, (Object error, StackTrace stack) {
      _handleError("未被 Flutter 捕获的错误", error, stack);
    });
  }

  static void _handleError(String message, Object? error, StackTrace? stack) {
    if (kReleaseMode) {
      exit(0);
    }
    LoggerUtils.e(message, error, stack);
    ErrorWidget.builder = (FlutterErrorDetails details) {
      return Container(
        color: Colors.green,
        child: SingleChildScrollView(
          child: Text(
            'message:$message exception:$error stack:$stack',
            style: TextStyle(color: Colors.red, fontSize: 15),
          ),
        ),
      );
    };
  }
}
