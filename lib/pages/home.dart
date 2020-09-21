import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:intrust/pages/recommend.dart';
import 'package:intrust/pages/optional.dart';
import 'package:intrust/pages/backtest.dart';
import 'package:intrust/pages/machine.dart';
import 'package:intrust/pages/stockDetail.dart';



import 'recommend.dart';
import 'optional.dart';
import 'backtest.dart';
import 'machine.dart';

import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_icons/flutter_icons.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home> {

  /// PersistentTabController是來自第三方的widget
  /// 用於實現持續的bottom tab bar
  final navigatorKey = GlobalKey<NavigatorState>();

  PersistentTabController _controller = PersistentTabController(initialIndex: 0);

  /// 此List提供了bottom tab bar裡的tabs
  List<Widget> _NavScreens(){
    return[
      recommend(),
      optional(),
      stockDetail(),
      backtest(),
      machine(),
    ];
  }

  /// 此List提供了tabs的properties
  /// 包括icons，titles，active和inactive colors
  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Octicons.bookmark),
        title: ("推薦"),
        activeColor: CupertinoColors.systemRed,
        inactiveColor: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Octicons.list_unordered),
        title: ("自選"),
        activeColor: CupertinoColors.systemRed,
        inactiveColor: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Octicons.person),
        title: ("InTrust"),
        activeColor: CupertinoColors.systemRed,
        inactiveColor: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Octicons.graph),
        title: ("回測"),
        activeColor: CupertinoColors.systemRed,
        inactiveColor: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Octicons.device_desktop),
        title: ("機器股"),
        activeColor: CupertinoColors.systemRed,
        inactiveColor: CupertinoColors.systemGrey,
      ),

    ];
  }

  /// 提供PersistentTabView的properties
  @override
  Widget build(BuildContext context) {
    return Center(
      child: PersistentTabView(
        controller: _controller,
        screens: _NavScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        hideNavigationBarWhenKeyboardShows: true,
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
        ),
        popAllScreensOnTapOfSelectedTab: true,
        /// navBarStyle 提供不同的風格
        /// 通過更改號碼自動修改風格
        navBarStyle: NavBarStyle.style8,
      ),
    );
  }

}
