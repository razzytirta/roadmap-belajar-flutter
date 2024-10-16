import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_navigation_80/main_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.offNamed('/main');
          },
          child: const Text("Login"),
        ),
      ),
    );
  }
}
