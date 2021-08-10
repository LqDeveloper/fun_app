import 'dart:io';

import 'package:localstorage/localstorage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';

class StorageManager {
  ///存储数据 iOS UserDefault, Android SharePreference
  static late SharedPreferences sharedPreferences;

  ///将数据存储到json文件中
  static late LocalStorage localStorage;

  ///临时文件夹
  static late Directory temDir;

  ///初始化
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    temDir = await getTemporaryDirectory();
    localStorage = LocalStorage("LocalStorage");
    await localStorage.ready;
  }
}
