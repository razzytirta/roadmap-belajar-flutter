import 'package:flutter/material.dart';

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
          backgroundColor: Colors.blueAccent,
          title: const Text(
            "Fonts Features",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                'Contoh 01 (Tanpa Apapun)',
                style: TextStyle(fontSize: 20),
              ),
              const Text(
                "Contoh 02 (Small Caps)",
                style: TextStyle(
                    fontSize: 20, fontFeatures: [FontFeature.enable('smcp')]),
              ),
              const Text(
                "Contoh 3 1/2 (Small Caps & Frac)",
                style: TextStyle(
                  fontSize: 20,
                  fontFeatures: [
                    FontFeature.enable('smcp'),
                    FontFeature.enable('frac')
                  ],
                ),
              ),
              const Text(
                "Milonga 3 1/2 (Small Caps & Frac)",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: "Milonga",
                  fontFeatures: [
                    FontFeature.enable('smcp'),
                    FontFeature.enable('frac')
                  ],
                ),
              ),
              const Text(
                "Contoh Cardo 19 (Tanpa Apapun)",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: "Cardo",
                ),
              ),
              const Text(
                "Contoh Cardo 19 (Old Style)",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: "Cardo",
                  fontFeatures: [
                    FontFeature.oldstyleFigures(),
                  ],
                ),
              ),
              const Text(
                "Gabriela (Default)",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: "Gabriela",
                ),
              ),
              Text(
                "Gabriela (Style set nomor 5)",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: "Gabriela",
                  fontFeatures: [
                    FontFeature.stylisticSet(5),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
