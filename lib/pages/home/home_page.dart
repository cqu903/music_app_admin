import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:music_app_admin/events/menu_item_tab_event.dart';
import 'package:music_app_admin/pages/home/banner.dart' as banner;
import 'package:music_app_admin/pages/home/side_bar.dart';
import 'package:music_app_admin/pages/login/login_page.dart';
import 'package:music_app_admin/routes.dart';
import 'package:music_app_admin/secure/secure_context.dart';

import 'main_content.dart';

EventBus menuItemTouchEventBus = EventBus();

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<MainContentState> mainContentKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    menuItemTouchEventBus.on<MenuItemTabEvent>().listen((event) {
      mainContentKey.currentState?.update(routes[event.widgetName]!);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (SecureContext.secureContext == null) {
      return const LoginPage();
    } else {
      return Scaffold(
          body: Column(
        children: <Widget>[
          const banner.Banner(),
          Expanded(
              child: Row(children: [SideBar(), MainContent(mainContentKey)]))
        ],
      ));
    }
  }
}
