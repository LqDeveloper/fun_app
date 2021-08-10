import 'package:flutter/material.dart';

class SplashWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashState();
  }
}

class _SplashState extends State<SplashWidget> with TickerProviderStateMixin {
  late AnimationController _logoController;
  late Animation<double> _animation;
  late AnimationController _countDownController;

  @override
  void initState() {
    super.initState();
    _logoController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));
    _animation = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _logoController, curve: Curves.easeInOut));
    _countDownController =
        AnimationController(vsync: this, duration: Duration(seconds: 4));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
