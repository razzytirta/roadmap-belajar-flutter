import 'package:flutter/material.dart';
import 'package:http_request_35/post_result_model.dart';
import 'package:http_request_35/user_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  PostResult? postResult;
  User? user;
  String output = "No Data";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('API DEMO'),
          backgroundColor: Colors.greenAccent,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                (postResult != null)
                    ? "${postResult!.id}|${postResult!.name}|${postResult!.job}|${postResult!.createdAt}"
                    : "Tidak Ada Data",
              ),
              Text(
                (user != null) ? "${user!.id}|${user!.name}" : "Tidak Ada Data",
              ),
              Text(output),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.greenAccent),
                    onPressed: () {
                      User.getAllUsers("1").then((users) {
                        output = "";
                        for (var user in users) {
                          output += "[${user.name}]";
                        }
                        setState(() {});
                      });
                    },
                    child: const Text(
                      'GET ALL USER',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.greenAccent),
                    onPressed: () {
                      User.connectToAPI("2").then(
                        (value) {
                          user = value;

                          setState(() {});
                        },
                      );
                    },
                    child: const Text(
                      'GET',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.greenAccent),
                    onPressed: () {
                      PostResult.connectToAPI("Razzi", "Tukang Koding").then(
                        (value) {
                          postResult = value;

                          setState(() {});
                        },
                      );
                    },
                    child: const Text(
                      'POST',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
