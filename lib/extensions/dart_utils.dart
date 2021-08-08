class DartUtils {
  ///判断值是否为null
  static bool isNull(dynamic value) => value == null;

  ///判断字符串或者集合是否为空
  static bool isEmpty(dynamic value) {
    if (value is String) {
      return value.toString().trim().isEmpty;
    }
    if (value is Iterable || value is Map) {
      return value.isEmpty;
    }
    return false;
  }

  ///value 是否有长度属性
  static bool hasLength(dynamic value) {
    return value is Iterable || value is String || value is Map;
  }

  ///判断value是null 或者为空集合或者空字符串
  static bool isNullOrBlank(dynamic value) {
    if (isNull(value)) {
      return true;
    }
    return isEmpty(value);
  }

  ///字符串是否符合正则表达式
  static bool hasMatch(String? value, String pattern) {
    return (value == null) ? false : RegExp(pattern).hasMatch(value);
  }

  ///判断字符串是否为数字（int,double）
  static bool isNum(String value) => num.tryParse(value) is num;

  ///字符串中是否只包含数字
  static bool isNumericOnly(String s) => hasMatch(s, r'^\d+$');

  ///字符串中是否只包含字母
  static bool isAlphabetOnly(String s) => hasMatch(s, r'^[a-zA-Z]+$');

  ///字符串是否包含最少一个大写字母
  static bool hasCapitalLetter(String s) => hasMatch(s, r'[A-Z]');

  ///是否是bool值
  static bool isBool(String value) =>
      (value == 'true' || value == '1' || value == 'false' || value == '0');

  ///文件是否是视频
  static bool isVideo(String filePath) {
    var ext = filePath.toLowerCase();
    return ext.endsWith(".mp4") ||
        ext.endsWith(".avi") ||
        ext.endsWith(".wmv") ||
        ext.endsWith(".rmvb") ||
        ext.endsWith(".mpg") ||
        ext.endsWith(".mpeg") ||
        ext.endsWith(".3gp");
  }

  ///文件是否是图片
  static bool isImage(String filePath) {
    final ext = filePath.toLowerCase();
    return ext.endsWith(".jpg") ||
        ext.endsWith(".jpeg") ||
        ext.endsWith(".png") ||
        ext.endsWith(".gif") ||
        ext.endsWith(".bmp");
  }

  ///文件是否是音频
  static bool isAudio(String filePath) {
    final ext = filePath.toLowerCase();
    return ext.endsWith(".mp3") ||
        ext.endsWith(".wav") ||
        ext.endsWith(".wma") ||
        ext.endsWith(".amr") ||
        ext.endsWith(".ogg");
  }

  ///文件是否是PPT
  static bool isPPT(String filePath) {
    final ext = filePath.toLowerCase();
    return ext.endsWith(".ppt") || ext.endsWith(".pptx");
  }

  ///文件是否是Word
  static bool isWord(String filePath) {
    final ext = filePath.toLowerCase();
    return ext.endsWith(".doc") || ext.endsWith(".docx");
  }

  ///文件是否是Excel
  static bool isExcel(String filePath) {
    final ext = filePath.toLowerCase();
    return ext.endsWith(".xls") || ext.endsWith(".xlsx");
  }

  ///文件是否是APK
  static bool isAPK(String filePath) {
    return filePath.toLowerCase().endsWith(".apk");
  }

  ///文件是否是PDF
  static bool isPDF(String filePath) {
    return filePath.toLowerCase().endsWith(".pdf");
  }

  ///文件是否是Txt
  static bool isTxt(String filePath) {
    return filePath.toLowerCase().endsWith(".txt");
  }

  ///文件是否是Chm
  static bool isChm(String filePath) {
    return filePath.toLowerCase().endsWith(".chm");
  }

  ///文件是否是Vector
  static bool isVector(String filePath) {
    return filePath.toLowerCase().endsWith(".svg");
  }

  ///文件是否是HTML
  static bool isHTML(String filePath) {
    return filePath.toLowerCase().endsWith(".html");
  }

  ///检验字符串是否是邮箱
  static bool isEmail(String s) => hasMatch(s,
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  ///检验字符串是否是手机号
  static bool isPhoneNumber(String s) {
    if (s.length > 16 || s.length < 9) return false;
    return hasMatch(s, r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$');
  }

  ///检验字符串是否是MD5
  static bool isMD5(String s) => hasMatch(s, r'^[a-f0-9]{32}$');

  ///检验字符串是否是SHA1编码字符
  static bool isSHA1(String s) =>
      hasMatch(s, r'(([A-Fa-f0-9]{2}\:){19}[A-Fa-f0-9]{2}|[A-Fa-f0-9]{40})');

  ///检验字符串是否是SHA256编码字符
  static bool isSHA256(String s) =>
      hasMatch(s, r'([A-Fa-f0-9]{2}\:){31}[A-Fa-f0-9]{2}|[A-Fa-f0-9]{64}');

  ///检验字符串是否是二级制
  static bool isBinary(String s) => hasMatch(s, r'^[0-1]+$');

  ///检验字符串是否是IPV4
  static bool isIPv4(String s) =>
      hasMatch(s, r'^(?:(?:^|\.)(?:2(?:5[0-5]|[0-4]\d)|1?\d?\d)){4}$');

  ///检验字符串是否是IPV6
  static bool isIPv6(String s) => hasMatch(s,
      r'^((([0-9A-Fa-f]{1,4}:){7}[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){6}:[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){5}:([0-9A-Fa-f]{1,4}:)?[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){4}:([0-9A-Fa-f]{1,4}:){0,2}[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){3}:([0-9A-Fa-f]{1,4}:){0,3}[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){2}:([0-9A-Fa-f]{1,4}:){0,4}[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){6}((\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b)\.){3}(\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b))|(([0-9A-Fa-f]{1,4}:){0,5}:((\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b)\.){3}(\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b))|(::([0-9A-Fa-f]{1,4}:){0,5}((\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b)\.){3}(\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b))|([0-9A-Fa-f]{1,4}::([0-9A-Fa-f]{1,4}:){0,5}[0-9A-Fa-f]{1,4})|(::([0-9A-Fa-f]{1,4}:){0,6}[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){1,7}:))$');

  ///检验字符串是否是表示颜色的字符串
  static bool isHexadecimal(String s) =>
      hasMatch(s, r'^#?([0-9a-fA-F]{3}|[0-9a-fA-F]{6})$');
}
