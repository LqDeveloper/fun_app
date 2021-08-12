import 'package:flutter/material.dart';
import 'package:fun_app/ui/home/article_item_widget.dart';
import 'package:fun_app/ui/home/swiper_banner.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<HomePage> {
  late RefreshController _refreshController;

  @override
  void initState() {
    _refreshController = RefreshController(initialRefresh: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var bannerHeight = MediaQuery.of(context).size.width * 5 / 11;
    return SafeArea(
        top: false,
        child: SmartRefresher(
          controller: _refreshController,
          onRefresh: () {},
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                title: Text('首页'),
              ),
            ],
          ),
        ));
  }
}
