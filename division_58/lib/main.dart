import 'package:division/division.dart';
import 'package:division_58/custom_button.dart';
import 'package:division_58/my_button.dart';
import 'package:flutter/material.dart';
import 'package:division_58/style/custom_style.dart';

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
          title: Txt(
            "Division Example",
            style: CustomStyle.txtStyle.clone()..fontSize(18),
          ),
          backgroundColor: Colors.grey[900],
        ),
        backgroundColor: Colors.grey[800],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                buttonStyle: CustomStyle.buttonStyle,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                buttonStyle: CustomStyle.buttonStyle.clone()
                  ..background.color(Colors.green[300] ?? Colors.green)
                  ..border(all: 3, color: Colors.green[900] ?? Colors.green),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
