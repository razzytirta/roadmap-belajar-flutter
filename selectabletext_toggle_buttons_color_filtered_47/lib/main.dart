import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<bool> isSelected = [true, false, false];
  ColorFilter colorFilter =
      const ColorFilter.mode(Colors.blue, BlendMode.screen);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ColorFiltered(
        colorFilter: colorFilter,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: const Text(
                "Widget Selectable text Toggle Buttons ColorFiltered"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SelectableText(
                  "Ini adalah selectable text. siliahkan pilih saya",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  showCursor: true,
                  cursorWidth: 3,
                  cursorColor: Colors.red,
                ),
                const SizedBox(
                  height: 10,
                ),
                ToggleButtons(
                  isSelected: isSelected,
                  onPressed: (index) {
                    setState(() {
                      if (index == 0) {
                        colorFilter = const ColorFilter.mode(
                            Colors.blue, BlendMode.screen);
                      } else if (index == 1) {
                        colorFilter = const ColorFilter.mode(
                            Colors.green, BlendMode.softLight);
                      } else {
                        colorFilter = const ColorFilter.mode(
                            Colors.purple, BlendMode.multiply);
                      }

                      for (int i = 0; i < isSelected.length; i++) {
                        isSelected[i] = (i == index) ? true : false;
                      }
                    });
                  },
                  fillColor: Colors.red[50],
                  selectedColor: Colors.red,
                  selectedBorderColor: Colors.red,
                  splashColor: Colors.blue,
                  highlightColor: Colors.yellow,
                  borderRadius: BorderRadius.circular(15),
                  children: const [
                    Icon(Icons.access_alarm),
                    Icon(Icons.adb),
                    Icon(Icons.add_comment),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
