import 'dart:developer';

import 'package:music_app_admin/model/MusicCreateRequest.dart';
import 'package:music_app_admin/model/MusicFileLinkRequest.dart';
import 'package:music_app_admin/model/music_vo.dart';
import 'package:music_app_admin/utils/dio_utils.dart';

Future<List<MusicVo>> list() async {
  dynamic result = await DioUtils.getHttp("/musics");
  return (result as List<dynamic>).map((e) => MusicVo.fromJson(e)).toList();
}

Future<MusicVo> create(MusicCreateRequest request) async {
  dynamic result =
      await DioUtils.postHttp("/musics", parameters: request.toJson());
  return MusicVo.fromJson(result);
}

/// 将上传的文件和对应的music进行绑定
Future<MusicVo> linkFile(String musicId, String fileId) async {
  MusicFileLinkRequest request =
      MusicFileLinkRequest(musicId: musicId, fileId: fileId);
  log(request.toJson().toString());
  dynamic result =
      await DioUtils.postHttp("/musics/link", parameters: request.toJson());
  log(result.runtimeType.toString());
  return MusicVo.fromJson(result);
}
