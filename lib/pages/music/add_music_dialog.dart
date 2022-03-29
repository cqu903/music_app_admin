import 'package:flutter/material.dart';
import 'package:music_app_admin/api/music_api.dart';
import 'package:music_app_admin/model/MusicCreateRequest.dart';
import 'package:music_app_admin/model/music_vo.dart';

class AddMusicDialog extends StatefulWidget {
  const AddMusicDialog({Key? key}) : super(key: key);

  @override
  _AddMusicDialogState createState() => _AddMusicDialogState();
}

class _AddMusicDialogState extends State<AddMusicDialog> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? name, description;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 400,
        width: 600,
        child: Material(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const Text(
                    "添加音乐",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF27272d)),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: '音乐名',
                    ),
                    validator: (value) {
                      return value!.isEmpty ? "音乐名不能为空" : null;
                    },
                    onSaved: (value) {
                      name = value!;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(hintText: "简介"),
                    onSaved: (value) {
                      description = value!;
                    },
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  ButtonBar(
                    children: [
                      ElevatedButton(
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                              MusicVo musicVo = await create(MusicCreateRequest(
                                  name: name!, description: description!));
                              Navigator.of(context).pop(musicVo);
                            }
                          },
                          child: const Text("确认")),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop(null);
                          },
                          child: const Text("取消")),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
