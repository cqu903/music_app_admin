import 'package:flutter/material.dart';

import 'login_panel.dart';

/// 登录页面
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              //渐变位置
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                //渐变颜色[始点颜色, 结束颜色]
                colors: [Color(0xFFc2ffd8), Color(0xFF465efb)]),
          ),
          alignment: const Alignment(0, 0),
          child: const LoginPanel(),

        ));
  }
}
