import 'package:flutter/material.dart';
import 'package:music_app_admin/api/login_api.dart';
import 'package:music_app_admin/model/login_vo.dart';
import 'package:music_app_admin/model/token_vo.dart';

import '../../secure/secure_context.dart';
import 'login_button.dart';
import 'music_title.dart';

class LoginPanel extends StatefulWidget {
  const LoginPanel({Key? key}) : super(key: key);

  @override
  _LoginPanelState createState() => _LoginPanelState();
}

class _LoginPanelState extends State<LoginPanel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String username, password;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          color: Colors.white),
      width: 404,
      height: 350,
      padding: const EdgeInsets.fromLTRB(48, 20, 48, 10),
      child: Column(
        children: <Widget>[
          Form(
            key: _formKey,
            child: Column(
              children: [
                const MusicTitle(),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: '请输入用户名',
                  ),
                  validator: (value) {
                    return value!.isEmpty ? "用户名不能为空" : null;
                  },
                  onSaved: (value) {
                    username = value!;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(hintText: "请输入密码"),
                  obscureText: true,
                  validator: (value) {
                    return value!.isEmpty ? "密码不能为空" : null;
                  },
                  onSaved: (value) {
                    password = value!;
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
                LoginButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      TokenVo tokenVo = await login(TokenCreateRequest(
                          username: username, password: password));
                      SecureContext.build(tokenVo.token!);
                      Navigator.of(context).popAndPushNamed("/");
                    }
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
