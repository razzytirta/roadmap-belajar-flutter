import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.lightGreen,
        title: const Text(
          'Second Page',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.lightGreen,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            'Go to main page',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
