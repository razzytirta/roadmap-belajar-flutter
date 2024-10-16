import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_navigation_80/main_page.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Third Page"),
        backgroundColor: Colors.cyan[300],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.back(result: "Ini Nilai dari page 3");
              },
              child: const Text("Back to Second Page"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.offAll(const MainPage());
              },
              child: const Text("Back to Main Page"),
            ),
          ],
        ),
      ),
    );
  }
}
