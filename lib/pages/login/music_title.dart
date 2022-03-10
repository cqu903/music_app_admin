import 'package:flutter/cupertino.dart';

class MusicTitle extends StatelessWidget {
  const MusicTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      "我的音乐盒子",
      style: TextStyle(
          fontSize: 24, fontWeight: FontWeight.w500, color: Color(0xFF27272d)),
    );
  }
}
