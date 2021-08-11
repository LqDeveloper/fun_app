import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

class FunToast extends OKToast {
  FunToast({required Widget child})
      : super(
            child: child,
            textStyle: TextStyle(color: Colors.white, fontSize: 20),
            textAlign: TextAlign.center,
            position: ToastPosition.center,
            textPadding: EdgeInsets.all(10),
            backgroundColor: Colors.black,
            movingOnWindowChange: true,
            duration: Duration(seconds: 2),
            dismissOtherOnShow: true);
}
