import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
class SwiperBanner extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SwiperState();
  }
}

class _SwiperState extends State<SwiperBanner> {
  List<Color> colors = [Colors.red, Colors.greenAccent, Colors.yellow];
  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemCount: colors.length,
      autoplay: true,
      autoplayDelay: 3000,
      scrollDirection: Axis.horizontal,
      viewportFraction: 1,
      loop: true,
      pagination: SwiperPagination(
          builder: DotSwiperPaginationBuilder(
              color: Colors.grey, size: 10, activeColor: Colors.blue, space: 5),
          alignment: Alignment.bottomCenter),
      autoplayDisableOnInteraction: true,
      scale: 1,
      itemBuilder: (context, index) {
        return InkWell(
          child: Container(
            color: colors[index],
          ),
        );
      },
    );
  }
}

