import 'package:division/division.dart';
import 'package:division_58/style/custom_style.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final ParentStyle? buttonStyle;

  // ignore: prefer_const_constructors_in_immutables
  CustomButton({super.key, this.buttonStyle});
  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool isTapDown = false;
  @override
  Widget build(BuildContext context) {
    return Parent(
      style: widget.buttonStyle!.clone()
        ..scale((isTapDown) ? 1.1 : 1)
        ..elevation((isTapDown) ? 0 : 5),
      gesture: Gestures()
        ..onTapDown((details) {
          setState(() {
            isTapDown = true;
          });
        })
        ..onTapUp((details) {
          setState(() {
            isTapDown = false;
          });
        })
        ..onTapCancel(() {
          setState(() {
            isTapDown = false;
          });
        }),
      child: Container(
        child: Txt(
          "Division",
          style: CustomStyle.txtStyle,
        ),
      ),
    );
  }
}
