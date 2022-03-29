import 'package:dio/dio.dart';
import 'package:http_parser/src/media_type.dart';
import 'package:music_app_admin/api/api_constants.dart';
import 'package:music_app_admin/model/FileVo.dart';
import 'package:music_app_admin/secure/secure_context.dart';

Future<FileVo> upload(List<int> fileContent, String fileName) async {
  FormData formData = FormData.fromMap({
    "file": MultipartFile.fromBytes(fileContent,
        filename: fileName,
        contentType: MediaType.parse("multipart/form-data")),
  });

  dynamic headers = {
    'Accept': 'application/json,*/*',
    'Content-Type': 'application/json',
    'Authorization': SecureContext.secureContext!.token
  };
  var options = BaseOptions(
      connectTimeout: 350000,
      receiveTimeout: 150000,
      responseType: ResponseType.json,
      validateStatus: (status) {
        // 不使用http状态码判断状态，使用AdapterInterceptor来处理（适用于标准REST风格）
        return true;
      },
      baseUrl: baseUrl,
      headers: headers);

  dynamic result = await Dio(options).post(
    //上传结果
    baseUrl + "/files/upload",
    data: formData,
  );
  return FileVo.fromJson(result.data);
}
