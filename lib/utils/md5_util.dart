import 'dart:convert';

import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';

String bytes2MD5(List<int> data) {
  var digest = md5.convert(data);
  // 这里其实就是 digest.toString()
  return hex.encode(digest.bytes);
}

// md5 加密
String String2MD5(String data) {
  var content = const Utf8Encoder().convert(data);
  return bytes2MD5(content);
}
