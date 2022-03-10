import 'package:music_app_admin/model/page.dart';
import 'package:music_app_admin/model/user_vo.dart';
import 'package:music_app_admin/utils/dio_utils.dart';

Future<List<UserVo>> search(Page page) async {
  dynamic result = await DioUtils.getHttp("/users", parameters: page.toJson());
  List<dynamic> list = result['content'];
  List<UserVo> users = list.map((e) => UserVo.fromJson(e)).toList();
  return users;
}
