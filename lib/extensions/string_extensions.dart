import 'dart_utils.dart';

extension StringExtension on String {
  ///将字符串转为int
  int get toInt => int.parse(this);

  ///将字符串转为double
  double get toDouble => double.parse(this);

  ///将字符串转为Uri 如果该字符串不是Url 将抛出 FormatException
  ///
  ///Uri的基本形式 [scheme:]scheme-specific-part[#fragment]
  ///
  ///再进一步划分可以是 [scheme:][//host:port][path][?query][#fragment]
  ///path可以有多个，每个用/连接，
  ///例如
  /// scheme://authority/path1/path2/path3?query#fragment
  /// query参数可以带有对应的值，也可以不带，如果带对应的值用=表示，如:
  /// scheme://authority/path1/path2/path3?id = 1#fragment，这里有一个参数id，它的值是1
  /// query参数可以有多个，每个用&连接
  /// scheme://authority/path1/path2/path3?id = 1&name = mingming&old#fragment
  /// 这里有三个参数：
  ///  参数1：id，其值是:1
  ///  参数2：name，其值是:mingming
  ///  参数3：old，没有对它赋值，所以它的值是null
  ///  除了scheme、authority是必须要有的，其它的几个path、query、fragment，它们每一个可以选择性的要或不要，但顺序不能变，比如：
  ///  其中"path"可不要：scheme://authority?query#fragment
  ///  其中"path"和"query"可都不要：scheme://authority#fragment
  ///  其中"query"和"fragment"可都不要：scheme://authority/path
  ///  "path","query","fragment"都不要：scheme://authority
  ///
  ///其中authority,又可以分为host:port的形式，即再次划分后是这样的：
  ///[scheme:][//host:port][path][?query][#fragment]
  ///例如
  /// http://www.abcd.com:8080/yourpath/fileName.htm?stove=10&path=32&id=4#harvic
  /// scheme:匹对上面的两个Uri标准形式，很容易看出在：前的部分是scheme，所以这个Uri字符串的sheme是：http
  /// scheme-specific-part:很容易看出scheme-specific-part是包含在scheme和fragment之间的部分，也就是包括第二部分的[//authority][path][?query]这几个小部分
  /// ，所在这个Uri字符串的scheme-specific-part是：//www.abcd.com:8080/yourpath/fileName.htm?stove=10&path=32&id=4 ，
  /// 注意要带上//，因为除了[scheme:]和[#fragment]部分全部都是scheme-specific-part，当然包括最前面的//；
  /// fragment:这个是更容易看出的，因为在最后用#分隔的部分就是fragment，所以这个Uri的fragment是：harvic
  /// 下面就是对scheme-specific-part进行拆分了；
  /// 在scheme-specific-part中，最前端的部分就是authority，？后面的部分是query，中间的部分就是path
  /// authority：很容易看出scheme-specific-part最新端的部分是：www.abcd.com:8080
  /// query:在scheme-specific-part中，？后的部分为：stove=10&path=32&id=4
  /// path:在**query:**在scheme-specific-part中，除了authority和query其余都是path的部分:/yourpath/fileName.htm
  /// 又由于authority又一步可以划分为host:port形式，其中host:port用冒号分隔，冒号前的是host，冒号后的是port，所以：
  /// host:www.java2s.com
  /// port:8080
  Uri get toUri => Uri.parse(this);

  ///是否是绝对路径 如果该字符串不是Url 将抛出 FormatException
  bool get isAbsolute => toUri.isAbsolute;

  /// 获取Uri中的scheme(如 http) 如果该字符串不是Url 将抛出 FormatException
  String get scheme => toUri.scheme;

  /// 获取Uri中的authority(如 http://www.abcd.com:8080 中的 www.abcd.com:8080)
  /// 如果该字符串不是Url 将抛出 FormatException
  String get authority => toUri.authority;

  /// 获取Uri中的authority中的userInfo (如 http://user:password@host:80/path 中的 user:password)
  /// 如果该字符串不是Url 将抛出 FormatException
  String get userInfo => toUri.userInfo;

  /// 获取Uri中的host 如果该字符串不是Url 将抛出 FormatException
  String get host => toUri.host;

  /// 获取Uri中的port 如果该字符串不是Url 将抛出 FormatException
  int get port => toUri.port;

  /// 获取Uri中的path 如果该字符串不是Url 将抛出 FormatException
  String get path => toUri.path;

  /// 获取Uri中的query 如果该字符串不是Url 将抛出 FormatException
  String get query => toUri.query;

  /// 获取Uri中的fragment 如果该字符串不是Url 将抛出 FormatException
  String get fragment => toUri.fragment;

  /// 获取Uri中的pathSegments 如果该字符串不是Url 将抛出 FormatException
  List<String> get pathSegments => toUri.pathSegments;

  /// 获取Uri中的queryParameters 如果该字符串不是Url 将抛出 FormatException
  Map<String, String> get queryParameters => toUri.queryParameters;

  /// 获取Uri中的queryParametersAll 如果该字符串不是Url 将抛出 FormatException
  Map<String, List<String>> get queryParametersAll => toUri.queryParametersAll;

  ///判断字符串是否为数字（int,double）
  bool get isNum => DartUtils.isNum(this);

  ///字符串中是否只包含数字
  bool get isNumericOnly => DartUtils.isNumericOnly(this);

  ///字符串中是否只包含字母
  bool get isAlphabetOnly => DartUtils.isAlphabetOnly(this);

  ///字符串是否包含最少一个大写字母
  bool get hasCapitalLetter => DartUtils.hasCapitalLetter(this);

  ///是否是bool值
  bool get isBool => DartUtils.isBool(this);

  ///文件是否是视频
  bool get isVideo => DartUtils.isVideo(this);

  ///文件是否是图片
  bool get isImage => DartUtils.isImage(this);

  ///文件是否是音频
  bool get isAudio => DartUtils.isAudio(this);

  ///文件是否是PPT
  bool get isPPT => DartUtils.isPPT(this);

  ///文件是否是Word
  bool get isWord => DartUtils.isWord(this);

  ///文件是否是Excel
  bool get isExcel => DartUtils.isExcel(this);

  ///文件是否是APK
  bool get isAPK => DartUtils.isAPK(this);

  ///文件是否是PDF
  bool get isPDF => DartUtils.isPDF(this);

  ///文件是否是Txt
  bool get isTxt => DartUtils.isTxt(this);

  ///文件是否是Chm
  bool get isChm => DartUtils.isChm(this);

  ///文件是否是Vector
  bool get isVector => DartUtils.isVector(this);

  ///文件是否是HTML
  bool get isHTML => DartUtils.isHTML(this);

  ///检验字符串是否是邮箱
  bool get isEmail => DartUtils.isEmail(this);

  ///检验字符串是否是手机号
  bool get isPhoneNumber => DartUtils.isPhoneNumber(this);

  ///检验字符串是否是MD5
  bool get isMD5 => DartUtils.isMD5(this);

  ///检验字符串是否是SHA1编码字符
  bool get isSHA1 => DartUtils.isSHA1(this);

  ///检验字符串是否是SHA256编码字符
  bool get isSHA256 => DartUtils.isSHA256(this);

  ///检验字符串是否是二级制
  bool get isBinary => DartUtils.isBinary(this);

  ///检验字符串是否是IPV4
  bool get isIPv4 => DartUtils.isIPv4(this);

  ///检验字符串是否是IPV6
  bool get isIPv6 => DartUtils.isIPv6(this);

  ///检验字符串是否是表示颜色的字符串
  bool get isHexadecimal => DartUtils.isHexadecimal(this);
}
