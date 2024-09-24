import 'package:flutter/material.dart';

class DraftPage extends StatelessWidget {
  final Color? backgroundColor;
  final Widget? body;
  const DraftPage({super.key, this.backgroundColor = Colors.pink, this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: const Text(
          "Demo MultiBLoC in Multipage",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: body,
    );
  }
}
