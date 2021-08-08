import 'dart:html';

import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  ///获取ThemeData
  ThemeData get theme => Theme.of(this);

  ///当前是否处于深色模式
  bool get isDarkMode => (theme.brightness == Brightness.dark);

  ///当前是否处于浅色模式
  bool get isLightModel => (theme.brightness == Brightness.light);

  ///获取MediaQuery实例
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  ///为当前设备的亮度模式；注意调整屏幕亮度并不会改变该模式，与当前系统支持的黑暗模式和明亮模式相关
  Brightness get platformBrightness => MediaQuery.of(this).platformBrightness;

  ///为是否使用颜色反转，主要用于 iOS 设备
  bool get invertColors => MediaQuery.of(this).invertColors;

  ///为用户是否要求前景与背景之间的对比度高，主要用于 iOS 设备
  bool get highContrast => MediaQuery.of(this).highContrast;

  ///为平台是否要求禁用或减少动画
  bool get disableAnimations => MediaQuery.of(this).disableAnimations;

  /// 为平台是否要求使用粗体
  bool get boldText => MediaQuery.of(this).boldText;

  ///获取屏幕尺寸
  Size get mediaQuerySize => MediaQuery.of(this).size;

  ///获取屏幕宽度
  double get width => mediaQuerySize.width;

  ///获取屏幕高度
  double get height => mediaQuerySize.height;

  ///为屏幕内边距，一般是刘海儿屏或异形屏中被系统遮挡部分边距
  EdgeInsets get padding => MediaQuery.of(this).padding;

  ///视图内边距，为屏幕被刘海儿屏或异形屏中被系统遮挡部分，从 MediaQuery 边界的边缘计算；
  ///此值是保持不变；例如，屏幕底部的软件键盘可能会覆盖并占用需要底部填充的相同区域，因此不会影响此值；
  EdgeInsets get viewPadding => MediaQuery.of(this).viewPadding;

  ///为键盘弹出时等遮挡屏幕边距，其中 viewInsets.bottom 为键盘高度
  EdgeInsets get viewInsets => MediaQuery.of(this).viewInsets;

  ///为手势边距，如 Android Q 之后添加的向左滑动关闭页面等
  EdgeInsets get systemGestureInsets => MediaQuery.of(this).systemGestureInsets;

  ///获取屏幕的方向
  Orientation get orientation => MediaQuery.of(this).orientation;

  ///是否是横屏
  bool get isLandscape => orientation == Orientation.landscape;

  ///是否是竖屏
  bool get isPortrait => orientation == Orientation.portrait;

  ///屏幕像素比
  double get devicePixelRatio => MediaQuery.of(this).devicePixelRatio;

  ///每个逻辑像素的字体像素数。
  double get textScaleFactor => MediaQuery.of(this).textScaleFactor;

  ///[宽度] 和 [高度] 的量级中较小的一个。
  double get mediaQueryShortestSide => mediaQuerySize.shortestSide;

  ///屏宽大于800
  bool get showNavbar => (width > 800);

  ///[宽度] 和 [高度] 的量级中较小的一个小于800，被认为是手机
  bool get isPhone => (mediaQueryShortestSide < 600);

  /// [宽度] 和 [高度] 的量级中较小的一个大于600，被认为是小平板
  bool get isSmallTablet => (mediaQueryShortestSide >= 600);

  /// [宽度] 和 [高度] 的量级中较小的一个大于720，被认为是大平板 True if the shortestSide is largest than 720p
  bool get isLargeTablet => (mediaQueryShortestSide >= 720);

  /// 当前设备是否是平板
  bool get isTablet => isSmallTablet || isLargeTablet;

  ///展示SnackBar
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
      SnackBar snackBar) {
    return ScaffoldMessenger.of(this).showSnackBar(snackBar);
  }

  ///展示BottomSheet
  PersistentBottomSheetController<T> showBottomSheet<T>(
    WidgetBuilder builder, {
    Color? backgroundColor,
    double? elevation,
    ShapeBorder? shape,
    Clip? clipBehavior,
    AnimationController? transitionAnimationController,
  }) {
    return Scaffold.of(this).showBottomSheet(builder,
        backgroundColor: backgroundColor,
        elevation: elevation,
        shape: shape,
        clipBehavior: clipBehavior,
        transitionAnimationController: transitionAnimationController);
  }
}
