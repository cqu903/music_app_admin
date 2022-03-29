import 'package:flutter/material.dart';
import 'package:music_app_admin/events/menu_item_tab_event.dart';
import 'package:music_app_admin/pages/home/home_page.dart';
import 'package:music_app_admin/theme.dart';

class SideBar extends StatelessWidget {
  final double width = 200;
  final double menuItemWidth = 200 - 10;

  SideBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.only(
        top: 10,
        left: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MenuItem(
            label: "用户",
            contentKey: "user",
            width: menuItemWidth,
          ),
          MenuItem(
            label: "音乐",
            contentKey: "music",
            width: menuItemWidth,
          ),
          MenuItem(
            label: "测试",
            contentKey: "test",
            width: menuItemWidth,
          )
        ],
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String label;
  final String contentKey;
  final double width;

  const MenuItem({
    Key? key,
    required this.label,
    required this.width,
    required this.contentKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: primary.shade300,
      onTap: () {
        menuItemTouchEventBus.fire(MenuItemTabEvent(widgetName: contentKey));
      },
      child: Container(
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: primary))),
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 10, bottom: 5),
        width: width,
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: Text(
          label,
          style: primaryText,
        ),
      ),
    );
  }
}
