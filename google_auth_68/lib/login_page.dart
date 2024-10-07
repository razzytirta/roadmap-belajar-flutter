import 'package:flutter/material.dart';
import 'package:google_auth_68/auth_services.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              width: 300,
              height: 100,
              child: TextField(
                controller: emailController,
              ),
            ),
            SizedBox(
              width: 300,
              height: 100,
              child: TextField(
                controller: passwordController,
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                await AuthServices.signInAnonymous();
              },
              child: const Text("Sign In Anonymous"),
            ),
            ElevatedButton(
              onPressed: () async {
                await AuthServices.signIn(
                  emailController.text,
                  passwordController.text,
                );
              },
              child: const Text("Sign In"),
            ),
            ElevatedButton(
              onPressed: () async {
                await AuthServices.signUp(
                  emailController.text,
                  passwordController.text,
                );
              },
              child: const Text("Sign Up"),
            ),
          ],
        ),
      ),
    );
  }
}
