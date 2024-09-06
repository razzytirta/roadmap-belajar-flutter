import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController textController = TextEditingController(text: "No Name");

  bool isOn = false;

  void saveData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("name", textController.text);
    pref.setBool("isOn", isOn);
  }

  Future<String> getName() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString("name") ?? "No Name";
  }

  Future<bool> getOn() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool("isOn") ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Shared Preferences"),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: textController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    contentPadding: const EdgeInsets.all(10)),
              ),
              Switch(
                value: isOn,
                onChanged: (value) {
                  setState(() {
                    isOn = value;
                  });
                },
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent),
                      onPressed: () {
                        saveData();
                      },
                      child: const Text(
                        "Save",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent),
                      onPressed: () {
                        getName().then(
                          (value) {
                            textController.text = value;
                            setState(() {});
                          },
                        );
                        getOn().then(
                          (value) {
                            isOn = value;
                            setState(() {});
                          },
                        );
                      },
                      child: const Text(
                        "Load",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
