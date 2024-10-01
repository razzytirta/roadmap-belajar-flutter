import 'dart:math';

import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -5 / 180 * pi,
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(60),
        elevation: 5,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.lightBlue[300],
            borderRadius: BorderRadius.circular(60),
            border: Border.all(
              width: 3,
              color: Colors.lightBlue[900] ?? Colors.lightBlue,
            ),
          ),
          child: Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(60),
            child: InkWell(
              onTap: () {},
              splashColor: Colors.yellow,
              borderRadius: BorderRadius.circular(60),
              child: Container(
                padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                child: const Text(
                  "Division",
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: "Literata",
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
