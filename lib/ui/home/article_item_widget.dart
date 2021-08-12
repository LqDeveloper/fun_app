import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef ArticleItemCallback = void Function(int index);

class ArticleItemWidget extends StatelessWidget {
  final int index;
  final bool isTop;
  final ArticleItemCallback? onTap;

  ArticleItemWidget(
      {Key? key, required this.index, required this.isTop, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.blue.withOpacity(0.1),
        onTap: () {
          if (onTap == null) return;
          onTap!(index);
        },
        child: Material(
          color: isTop
              ? Theme.of(context).accentColor.withAlpha(10)
              : Theme.of(context).scaffoldBackgroundColor,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border(
                    bottom: Divider.createBorderSide(context,width: 1))),
            child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipOval(
                        child: Image.asset(
                          'assets/images/splash_flutter.png',
                          width: 20,
                          height: 20,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Text('小明',
                            style: Theme.of(context).textTheme.caption),
                      ),
                      Expanded(child: SizedBox.shrink()),
                      Text('两天前', style: Theme.of(context).textTheme.caption),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5,bottom: 5),
                    child: Text(
                      '这是文章内容',
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('广场Tap 自助',
                          style: TextStyle(color: Colors.black, fontSize: 12))
                    ],
                  ),
                ]),
          ),
        ));
  }
}
