import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as qrScan;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? text = 'Hasil QR Scan';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('QR Scan'),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(text!),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  text = await qrScan.scan();
                  setState(() {});
                },
                child: const Text("Scan"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
