import 'package:flutter/material.dart';

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
          centerTitle: true,
          title: const Text(
            'Row Column Widget',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.lightGreen,
        ),
        body: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Text 1'),
            Text('Text 2'),
            Text('Text 3'),
            Text('Text 4'),
            Row(
              children: [
                Text('Data 1'),
                Text('Data 2'),
                Text('Data 3'),
                Text('Data 4'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
