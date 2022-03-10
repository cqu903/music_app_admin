import 'package:flutter/cupertino.dart';

class Banner extends StatelessWidget {
  const Banner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      color: const Color.fromRGBO(154, 190, 226, 1),
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 30),
      child: const Text(
        "袁瑞的音乐盒子后台",
        style: TextStyle(fontSize: 50, fontWeight: FontWeight.w400),
      ),
    );
  }
}
