import 'package:flutter/material.dart';
import 'package:fun_app/generated/l10n.dart';
import 'package:fun_app/provider_model/bottom_nav_model.dart';
import 'package:fun_app/ui/home/home_page.dart';
import 'package:fun_app/ui/project_page.dart';
import 'package:fun_app/ui/structure_page.dart';
import 'package:fun_app/ui/user_page.dart';
import 'package:fun_app/ui/wechart_page.dart';
import 'package:provider/provider.dart';

class MainWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainState();
  }
}

class _MainState extends State<MainWidget> {
  final List<Widget> _pageList = [
    HomePage(),
    ProjectPage(),
    WeChatPage(),
    StructurePage(),
    UserPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageList[context.watch<BottomNavModel>().index],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: context.watch<BottomNavModel>().index,
        onTap: (index) {
          context.read<BottomNavModel>().select(index);
        },
        selectedFontSize: 12,
        unselectedFontSize: 12,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: S.of(context).tabHome),
          BottomNavigationBarItem(
              icon: Icon(Icons.format_list_bulleted),
              label: S.of(context).tabProject),
          BottomNavigationBarItem(
              icon: Icon(Icons.group_work), label: S.of(context).wechatAccount),
          BottomNavigationBarItem(
              icon: Icon(Icons.call_split), label: S.of(context).tabStructure),
          BottomNavigationBarItem(
              icon: Icon(Icons.insert_emoticon), label: S.of(context).tabUser),
        ],
      ),
    );
  }
}
