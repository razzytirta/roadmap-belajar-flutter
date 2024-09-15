import 'package:flutter/material.dart';
import 'package:flutter_doc_comment_43/user_profie.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final UserProfile profile = UserProfile(
    name: "Razzi",
    role: "Admin",
    photoURL:
        "https://cdn1.iconfinder.com/data/icons/user-avatar-20/64/18-man-512.png",
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red[900],
          title: Text("Doc Comment Example"),
        ),
        body: Center(
          child: profile,
        ),
      ),
    );
  }
}
