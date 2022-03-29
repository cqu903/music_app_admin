import 'package:flutter/cupertino.dart';
import 'package:music_app_admin/pages/music/music_page.dart';
import 'package:music_app_admin/pages/test/test_page.dart';
import 'package:music_app_admin/pages/user/user_page.dart';

Map<String, Widget> routes = {
  'music': const MusicPage(),
  'user': const UserPage(),
  'test': const TestPage(),
};
