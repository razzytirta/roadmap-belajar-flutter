import 'dart:io';

import 'package:flutter/material.dart';
import 'package:guided_camera_83/camera_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  File? imageFile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Camera Test"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20, bottom: 10),
              width: 300,
              height: 450,
              color: Colors.grey[200],
              child: (imageFile != null)
                  ? Image.file(imageFile!)
                  : const SizedBox(),
            ),
            ElevatedButton(
              onPressed: () async {
                imageFile = await Navigator.push<File>(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CameraPage(),
                  ),
                );
                setState(() {});
              },
              child: const Text("Take Picture"),
            ),
          ],
        ),
      ),
    );
  }
}
