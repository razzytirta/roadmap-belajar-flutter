import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_auth_68/auth_services.dart';

class MainPage extends StatelessWidget {
  final User user;
  const MainPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Page'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(user.uid),
            ElevatedButton(
                onPressed: () async {
                  await AuthServices.signOut();
                },
                child: const Text("Sign Out"))
          ],
        ),
      ),
    );
  }
}
