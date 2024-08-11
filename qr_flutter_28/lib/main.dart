import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

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
          backgroundColor: Colors.blueAccent,
          title: const Text(
            "Belajar QR Code",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: Center(
          child: QrImageView(
            data: "www.github.com/Fachrurazzi",
            version: 6,
            backgroundColor: Colors.transparent,
            eyeStyle: const QrEyeStyle(
              eyeShape: QrEyeShape.square,
              color: Colors.black,
            ),
            padding: const EdgeInsets.all(0),
            errorCorrectionLevel: QrErrorCorrectLevel.M,
            size: 300,
          ),
        ),
      ),
    );
  }
}
