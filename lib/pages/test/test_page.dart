import 'package:flutter/material.dart';
import 'package:music_app_admin/model/FileVo.dart';

import '../../widgets/uploader.dart';

class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton.icon(
            onPressed: () async {
              FileVo? result = await showUploaderDialog(context);
              print(result!.key);
            },
            icon: const Icon(Icons.add),
            label: const Text("点击"))
      ],
    ));
  }
}
