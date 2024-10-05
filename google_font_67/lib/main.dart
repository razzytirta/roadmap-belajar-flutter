import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.sriracha().fontFamily,
        useMaterial3: true,
        textTheme: GoogleFonts.srirachaTextTheme().copyWith(
          bodySmall: GoogleFonts.modak(),
        ),
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    Color fontColor = const Color(0xffffb401);
    return Scaffold(
      backgroundColor: const Color(0xff1e252d),
      appBar: AppBar(
        backgroundColor: const Color(0xff282f37),
        title: const Text(
          'Google Fonts',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "I'ill keep learning flutter!",
              style: TextStyle(
                color: fontColor,
                fontSize: 25,
              ),
            ),
            Text(
              "O yeah!!",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: fontColor,
                    fontSize: 25,
                  ),
            )
          ],
        ),
      ),
    );
  }
}
