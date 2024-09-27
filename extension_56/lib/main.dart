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
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  final double x = -5;
  List<int> myList = [1, 2, 3];
  MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey,
        title: const Text("Extension"),
      ),
      body: Center(
        child: Text(
          "Bilangan : ${myList.midElement}",
          style: const TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}

extension ListExtension<T> on List {
  T get midElement => (isEmpty) ? null : this[(length / 2).floor()];
}

extension NumberExtension<T extends num> on num {
  num negate() => -1 * this;
}

extension StringExtension on String {
  String operator &(String other) => "$this-$other";
}
