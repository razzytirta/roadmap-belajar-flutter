import 'package:flutter/material.dart';
import 'package:rive_flutter/switch_day_night.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.pink,
        title: const Text(
          "Rive + Flutter",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: const Center(child: SwitchDaytNight()),
    );
  }
}
