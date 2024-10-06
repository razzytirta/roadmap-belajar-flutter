import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_auth_68/login_page.dart';
import 'package:google_auth_68/main_page.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    User? firebaseUser = Provider.of<User?>(context);

    return (firebaseUser == null)
        ? const LoginPage()
        : MainPage(user: firebaseUser);
  }
}
