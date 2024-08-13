import 'package:flutter/material.dart';
import 'package:transform_29/colorful_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Belajar Transform",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ColorfulButton(
                Colors.pink,
                Colors.blue,
                Icons.comment,
              ),
              ColorfulButton(
                Colors.amber,
                Colors.red,
                Icons.call,
              ),
              ColorfulButton(
                Colors.green,
                Colors.purple,
                Icons.star,
              ),
              ColorfulButton(
                Colors.orange,
                Colors.grey,
                Icons.settings,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
