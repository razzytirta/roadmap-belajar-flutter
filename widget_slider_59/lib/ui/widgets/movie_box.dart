import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:widget_slider_59/ui/styles/styles.dart';

class MovieBox extends StatelessWidget {
  final String? url;
  final double? scale;
  const MovieBox({super.key, this.url, this.scale = 1});

  @override
  Widget build(BuildContext context) {
    return Parent(
      style: parentStyle.clone()
        ..background.image(
          fit: BoxFit.cover,
          imageProveder: url != null
              ? NetworkImage(url!)
              : const AssetImage('assets/image/placeholder.jpg')
                  as ImageProvider,
        )
        ..width(200 * scale!)
        ..height(300 * scale!),
    );
  }
}
