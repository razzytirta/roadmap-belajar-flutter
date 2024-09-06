import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isON = false;
  Widget myWidget = Container(
    width: 200,
    height: 100,
    decoration: BoxDecoration(
      color: Colors.red,
      border: Border.all(
        color: Colors.black,
        width: 2,
      ),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Animated Switcher'),
          backgroundColor: Colors.green,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AnimatedSwitcher(
                duration: const Duration(seconds: 1),
                child: myWidget,
                transitionBuilder: (child, animation) => RotationTransition(
                  turns: animation,
                  child: child,
                ),
              ),
              Switch(
                activeColor: Colors.green,
                inactiveTrackColor: Colors.red[200],
                inactiveThumbColor: Colors.red,
                value: isON,
                onChanged: (value) {
                  isON = value;

                  setState(() {
                    if (isON) {
                      myWidget = Container(
                        key: const ValueKey(1),
                        width: 200,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          border: Border.all(
                            color: Colors.black,
                            width: 2,
                          ),
                        ),
                      );
                      // myWidget = SizedBox(
                      //   width: 200,
                      //   height: 100,
                      //   child: Center(
                      //     child: const Text(
                      //       "Switch: ON",
                      //       style: TextStyle(
                      //           color: Colors.green,
                      //           fontWeight: FontWeight.w700,
                      //           fontSize: 20),
                      //     ),
                      //   ),
                      // );
                    } else {
                      myWidget = Container(
                        key: const ValueKey(2),
                        width: 200,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          border: Border.all(
                            color: Colors.black,
                            width: 2,
                          ),
                        ),
                      );
                    }
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
