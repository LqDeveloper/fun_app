import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'utils/app_error_handle.dart';

void main() {
  AppErrorHandle.runAppWidge(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OKToast(
        child: MaterialApp(
      debugShowCheckedModeBanner: false,
    ));
  }
}
