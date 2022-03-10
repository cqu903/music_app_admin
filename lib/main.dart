import 'package:flutter/material.dart';
import 'package:music_app_admin/pages/home/home_page.dart';
import 'package:music_app_admin/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '音乐后台',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, tabBarTheme: tabBarTheme),
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => const HomePage(),
      },
    );
  }
}
