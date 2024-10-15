import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});
  final int amount = 1000000;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Currency Format",
          style: GoogleFonts.poppins(),
        ),
        backgroundColor: Colors.pink[700],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Normal",
              style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
            ),
            Text(
              "$amount",
              style: GoogleFonts.poppins(
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: Colors.pink[700],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Currency",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              NumberFormat.currency(
                locale: 'id',
                decimalDigits: 0,
                symbol: "Rp. ",
              ).format(amount),
              style: GoogleFonts.poppins(
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: Colors.pink[700],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Compact Currency",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              NumberFormat.compactCurrency(locale: 'id', decimalDigits: 0)
                  .format(amount + 350000),
              style: GoogleFonts.poppins(
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: Colors.pink[700],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
