import 'package:music_app_admin/model/login_vo.dart';
import 'package:music_app_admin/model/token_vo.dart';
import 'package:music_app_admin/utils/dio_utils.dart';

Future<TokenVo> login(TokenCreateRequest loginVo) async {
  dynamic responseData =
      await DioUtils.postHttp("/login", parameters: loginVo.toJson());
  return TokenVo.fromJson(responseData);
}
