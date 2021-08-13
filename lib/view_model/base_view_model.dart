import 'package:flutter/material.dart';

enum ViewState {
  idle, //空闲状态
  busy, //加载中
  empty, //无数据
  error, //加载失败
}

class ViewStateError {
  final int errorCode;
  final String message;

  ViewStateError({required this.errorCode, required this.message});

  @override
  String toString() {
    return 'ViewStateError{errorType: $errorCode, message: $message';
  }
}

class BaseViewModel with ChangeNotifier {
  ///防止页面销毁后，异步任务才完成，导致报错
  bool _disposed = false;

  @override
  void notifyListeners() {
    if (!_disposed) {
      super.notifyListeners();
    }
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }
}
