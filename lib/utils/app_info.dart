import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppInfo {
  static Future<PackageInfo> get packageInfo => PackageInfo.fromPlatform();

  static Future<String> get version async {
    var info = await PackageInfo.fromPlatform();
    return info.version;
  }

  static Future<String> get buildNumber async {
    var info = await PackageInfo.fromPlatform();
    return info.buildNumber;
  }

  static Future get deviceInfo async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      return await deviceInfo.androidInfo;
    } else if (Platform.isIOS) {
      return await deviceInfo.iosInfo;
    } else {
      return null;
    }
  }
}
