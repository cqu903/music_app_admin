import 'package:music_app_admin/model/user_vo.dart';
import 'package:music_app_admin/utils/dio_utils.dart';

Future<List<UserVo>> list() async {
  dynamic result = await DioUtils.getHttp("/users");
  var list = (result['content'] as List<dynamic>)
      .map((e) => UserVo.fromJson(e))
      .toList();
  return list;
}
