import 'package:flutter/material.dart';
import 'package:navigation_widget_15/main_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.lightGreen,
          ),
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) {
                return MainPage();
              },
            ));
          },
          child: const Text(
            'Login',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
