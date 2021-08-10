import 'package:flutter/cupertino.dart';
import 'package:fun_app/generated/l10n.dart';
import 'package:fun_app/utils/storage_manager.dart';

class LocaleModel with ChangeNotifier {
  static const _localList = ['', 'zh-CN', 'en'];
  static const _localIndexKey = 'LocalIndex';
  int _localIndex = 0;

  int get localIndex => _localIndex;

  Locale? get locale {
    if (_localIndex >= _localList.length && _localList.length < 0) {
      return null;
    }
    var value = _localList[_localIndex].split('-');
    return Locale(value[0], value.length == 2 ? value[1] : '');
  }

  LocaleModel() {
    _localIndex = StorageManager.sharedPreferences.getInt(_localIndexKey) ?? 0;
  }

  void switchLocal(int index) {
    _localIndex = index;
    notifyListeners();
    StorageManager.sharedPreferences.setInt(_localIndexKey, index);
  }

  String localName(BuildContext context, int index) {
    switch (index) {
      case 0:
        return S.of(context).autoBySystem;
      case 1:
        return '中文';
      case 2:
        return 'English';
      default:
        return '';
    }
  }
}
