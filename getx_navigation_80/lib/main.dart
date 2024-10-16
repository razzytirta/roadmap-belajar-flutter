import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_navigation_80/login_page.dart';
import 'package:getx_navigation_80/main_page.dart';
import 'package:getx_navigation_80/second_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const LoginPage()),
        GetPage(
            name: '/second',
            page: () => const SecondPage(),
            transition: Transition.zoom),
        GetPage(name: '/main', page: () => const MainPage()),
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}
