import 'dart:developer';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:music_app_admin/api/file_upload_api.dart';
import 'package:music_app_admin/model/FileVo.dart';
import 'package:music_app_admin/theme.dart';

typedef OnUploadedCallback = void Function(FileVo?);

Future<FileVo?> showUploaderDialog(BuildContext context,
    {double? limitSize, List<String>? extensions}) async {
  FileVo? result = await showDialog<FileVo>(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return SimpleDialog(
        contentPadding: const EdgeInsets.fromLTRB(0.0, 0, 0.0, 0),
        children: <Widget>[
          _Uploader(
            limitSize: limitSize ?? 1024000,
            extensions: extensions,
          )
        ],
      );
    },
  );

  return result;
}

class _Uploader extends StatefulWidget {
  final List<String>? extensions;
  final double? limitSize;
  final OnUploadedCallback? onUploadCallback;

  _Uploader({
    Key? key,
    this.extensions,
    this.limitSize,
    this.onUploadCallback,
  }) : super(key: key);

  @override
  _UploaderState createState() => _UploaderState();
}

class _UploaderState extends State<_Uploader> {
  bool _isSelectFile = false;
  double? _value;
  String? errorString;
  FileVo? _fileVo;

  void _pickFile() async {
    setState(() {
      errorString = null;
      _fileVo = null;
      _isSelectFile = false;
      _value = null;
    });
    log((widget.extensions == null || widget.extensions!.isEmpty).toString());
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowMultiple: false,
      allowedExtensions: widget.extensions ?? [],
    );
    if (result != null) {
      PlatformFile file = result.files.first;
      if (widget.limitSize != null) {
        if (file.size > widget.limitSize!) {
          setState(() {
            errorString = "文件大小超出限制";
          });
          return;
        }
      }
      setState(() {
        _isSelectFile = true;
      });
      //开始上传初始化
      upload(file.bytes!, file.name).then((FileVo fileVo) {
        assert(fileVo.id != null);
        _fileVo = fileVo;
        setState(() {
          _value = 1;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: primary),
          borderRadius: const BorderRadius.all(Radius.circular(2))),
      width: 500,
      child: Column(
        children: [
          _UploadTitle(
            onStartPickFile: _pickFile,
          ),
          _UploadPanel(
            isSelectedFile: _isSelectFile,
            value: _value,
          ),
          _value == 1
              ? TextButton(
                  onPressed: () {
                    //TODO 处理外部回调函数，然后执行后续操作
                    if (widget.onUploadCallback != null) {
                      widget.onUploadCallback!(_fileVo);
                    }
                    Navigator.of(context).pop(_fileVo);
                  },
                  child: const Text("上传成功"))
              : const SizedBox.shrink(),
          errorString == null
              ? const SizedBox.shrink()
              : Text(errorString!, style: secondaryText),
        ],
      ),
    );
  }
}

class _UploadTitle extends StatelessWidget {
  final Function onStartPickFile;

  const _UploadTitle({
    Key? key,
    required this.onStartPickFile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      height: 35,
      color: Colors.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "文件上传",
            style: TextStyle(color: Colors.white),
          ),
          IconButton(
            onPressed: () {
              onStartPickFile();
            },
            icon: const Icon(Icons.add),
            color: Colors.white,
          )
        ],
      ),
    );
  }
}

class _UploadPanel extends StatelessWidget {
  const _UploadPanel(
      {Key? key, required this.isSelectedFile, required this.value})
      : super(key: key);
  final bool isSelectedFile;
  final double? value;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 100),
      child: isSelectedFile
          ? Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                  child: SizedBox(
                    height: 5,
                    child: LinearProgressIndicator(
                      valueColor:
                          const AlwaysStoppedAnimation<Color>(Colors.blue),
                      value: value,
                    ),
                  ),
                ),
              ],
            )
          : const SizedBox.shrink(),
    );
  }
}
