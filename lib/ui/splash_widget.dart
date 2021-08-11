import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

class SplashWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashState();
  }
}

class _SplashState extends State<SplashWidget> with TickerProviderStateMixin {
  late AnimationController _countDownController;
  var _visible = true;

  @override
  void initState() {
    _countDownController =
        AnimationController(vsync: this, duration: Duration(seconds: 4));
    _countDownController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _countDownController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () => Future.value(false),
        child: SafeArea(
          top: false,
          bottom: false,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset('assets/images/splash_bg.png', fit: BoxFit.fill),
              AnimatedLogo(),
              Visibility(
                visible: _visible,
                child: Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      margin: EdgeInsets.only(right: 20, bottom: 34),
                      width: 100,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(5)),
                      child: CountDownAnimated(
                          animation: IntTween(begin: 4, end: 1)
                              .animate(_countDownController),
                          onEnd: () {
                            setState(() {
                              _visible = false;
                            });
                            showToast("倒计时结束了");
                          }),
                    )),
              )
            ],
          ),
        ));
  }
}

class AnimatedLogo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AnimatedLogoState();
  }
}

class _AnimatedLogoState extends State<AnimatedLogo> {
  bool isZero = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isZero = false;
        });
      },
      child: AnimatedContainer(
        duration: Duration(seconds: 1),
        alignment: Alignment(0, isZero ? 0 : 0.7),
        child: Image.asset(
          "assets/images/splash_flutter.png",
          width: 280,
          height: 120,
        ),
        onEnd: () {
          setState(() {
            isZero = !isZero;
          });
        },
      ),
    );
  }
}

class CountDownAnimated extends AnimatedWidget {
  final Animation<int> animation;
  final VoidCallback? onEnd;

  CountDownAnimated({required this.animation, this.onEnd})
      : super(listenable: animation) {
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        if (onEnd != null) {
          onEnd!();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var value = animation.value;
    return TextButton(
      child: Text(
        value == 0 ? '' : '$value' + '跳过',
        style: TextStyle(color: Colors.white, fontSize: 15),
      ),
      onPressed: onEnd,
    );
  }
}
