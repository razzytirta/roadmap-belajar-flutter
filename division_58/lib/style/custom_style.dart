import 'package:division/division.dart';
import 'package:flutter/material.dart';

abstract class CustomStyle {
  static ParentStyle buttonStyle = ParentStyle(angleFormat: AngleFormat.degree)
    ..background.color(Colors.lightBlue[300] ?? Colors.lightBlue)
    ..borderRadius(all: 60)
    ..border(all: 3, color: Colors.lightBlue[900] ?? Colors.lightBlue)
    ..elevation(5)
    ..padding(left: 20, right: 20, top: 15, bottom: 15)
    ..rotate(-5);

  static TxtStyle txtStyle = TxtStyle()
    ..fontSize(30)
    ..fontFamily("Literata")
    ..bold()
    ..textColor(Colors.white);
}
