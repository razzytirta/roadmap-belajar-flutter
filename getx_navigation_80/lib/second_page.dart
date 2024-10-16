import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_navigation_80/third_page.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Page"),
        backgroundColor: Colors.cyan[300],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: const Text("Back to Main Page"),
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: (Get.arguments as List<String>)
                      .map(
                        (e) => Text(e),
                      )
                      .toList() +
                  [
                    Text(Get.parameters['name']!),
                    Text(Get.parameters['address']!),
                  ],
            )
            // ElevatedButton(
            //   onPressed: () async {
            //     String? result = await Get.to<String>(const ThirdPage());
            //     print("===>$result");
            //   },
            //   child: const Text("Go to Third Page"),
            // ),
          ],
        ),
      ),
    );
  }
}
