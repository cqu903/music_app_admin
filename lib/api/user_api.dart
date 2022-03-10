import 'package:music_app_admin/model/pagable_vo.dart';
import 'package:music_app_admin/model/page.dart';
import 'package:music_app_admin/model/paged_user.dart';
import 'package:music_app_admin/model/user_vo.dart';
import 'package:music_app_admin/utils/dio_utils.dart';

Future<PageObj<UserVo>> search(Page page) async {
  dynamic result = await DioUtils.getHttp("/users", parameters: page.toJson());
  return PageObj(
      pagableVo: PagableVo.fromJson(result),
      content: (result['content'] as List<dynamic>)
          .map((e) => UserVo.fromJson(e))
          .toList());
}
