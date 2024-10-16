import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_navigation_80/second_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Main Page"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.to(const SecondPage(),
                transition: Transition.zoom,
                duration: const Duration(seconds: 2));
          },
          child: const Text("Go to Second Page"),
        ),
      ),
    );
  }
}
