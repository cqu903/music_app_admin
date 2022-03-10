import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  VoidCallback onPressed;

  LoginButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 15),
          alignment: Alignment.center,
          child: const Text(
            "登录",
            style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: '宋体',
                letterSpacing: 3),
          ),
          width: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF057969), Color(0xFF1dccb5)])),
        ));
  }
}
