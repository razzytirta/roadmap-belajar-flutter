import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

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
          title: const Text("Shimmer Effect"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    width: 200,
                    height: 300,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                      image: const DecorationImage(
                        image: NetworkImage(
                            "https://static.wikia.nocookie.net/pure-good-wiki/images/3/3d/Shanks1.png/revision/latest?cb=20230907210547"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Shimmer(
                    period: const Duration(seconds: 5),
                    gradient: LinearGradient(
                      begin: const Alignment(-1, 0.25),
                      end: const Alignment(1, 0.25),
                      stops: const [0.4, 0.5, 0.6],
                      colors: [
                        Colors.white.withOpacity(0),
                        Colors.white.withOpacity(0.5),
                        Colors.white.withOpacity(0),
                      ],
                    ),
                    child: Container(
                      width: 200,
                      height: 300,
                      color: Colors.red,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Shimmer(
                period: Duration(seconds: 5),
                gradient: LinearGradient(
                  begin: Alignment(-1, 0.25),
                  end: Alignment(1, 0.25),
                  stops: [0.4, 0.5, 0.6],
                  colors: [
                    Colors.black,
                    Colors.white,
                    Colors.black,
                  ],
                ),
                child: Text(
                  "Akagami no Shanks",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
