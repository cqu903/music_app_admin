import 'package:flutter/material.dart';
import 'package:music_app_admin/theme.dart';

class MainContent extends StatefulWidget {
  const MainContent(Key key) : super(key: key);

  @override
  MainContentState createState() => MainContentState();
}

class MainContentState extends State<MainContent> {
  Widget? child;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        constraints:
            BoxConstraints(minHeight: MediaQuery.of(context).size.height),
        color: Colors.white,
        child: child ??
            const Text(
              "欢迎页面",
              style: primaryText,
            ),
      ),
    );
  }

  void update(Widget widget) {
    setState(() {
      child = widget;
    });
  }
}
