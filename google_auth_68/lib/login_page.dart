import 'package:flutter/material.dart';
import 'package:google_auth_68/auth_services.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () async {
              await AuthServices.signInAnonymous();
            },
            child: const Text("Sign In Anonymous")),
      ),
    );
  }
}
