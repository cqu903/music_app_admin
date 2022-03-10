import 'package:music_app_admin/model/page.dart';
import 'package:music_app_admin/model/paged_user.dart';
import 'package:music_app_admin/model/user_vo.dart';
import 'package:music_app_admin/utils/dio_utils.dart';

Future<List<UserVo>> search(Page page) async {
  dynamic result = await DioUtils.getHttp("/users", parameters: page.toJson());
  List<dynamic> list = result['content'];
  List<UserVo> users = list.map((e) => UserVo.fromJson(e)).toList();
  return users;
}

Future<PageObj<UserVo>> searchPage(Page page) async{
  dynamic result = await DioUtils.getHttp("/users", parameters: page.toJson());
  return PageObj(totalCount: result['rows'], content: (result['content'] as List<dynamic>).map((e) => UserVo.fromJson(e)).toList());
}