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
          title: const Text("Gradient Opacity"),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: ShaderMask(
            shaderCallback: (bounds) {
              return const LinearGradient(
                colors: [Colors.black, Colors.transparent],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ).createShader(
                Rect.fromLTRB(
                  0,
                  0,
                  bounds.width,
                  bounds.height,
                ),
              );
            },
            blendMode: BlendMode.dstIn,
            child: const Image(
                image:
                    NetworkImage("https://picsum.photos/seed/picsum/350/200")),
          ),
        ),
      ),
    );
  }
}
