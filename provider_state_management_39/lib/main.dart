import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management_39/application_color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider<ApplicationColor>(
        create: (context) => ApplicationColor(),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            centerTitle: true,
            title: Consumer<ApplicationColor>(
              builder: (context, applicationColor, _) => Text(
                "Provider State Management",
                style: TextStyle(color: applicationColor.color),
              ),
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer<ApplicationColor>(
                  builder: (context, applicationColor, _) => AnimatedContainer(
                    margin: const EdgeInsets.all(5),
                    width: 100,
                    height: 100,
                    color: applicationColor.color,
                    duration: const Duration(milliseconds: 500),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(5),
                      child: const Text("AB"),
                    ),
                    Consumer<ApplicationColor>(
                      builder: (context, applicationColor, _) => Switch(
                          value: applicationColor.isLigtBlue,
                          onChanged: (value) {
                            applicationColor.isLigtBlue = value;
                          }),
                    ),
                    Container(
                      margin: const EdgeInsets.all(5),
                      child: const Text("LB"),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
