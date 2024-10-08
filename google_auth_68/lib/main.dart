import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_auth_68/auth_services.dart';
import 'package:google_auth_68/database_services.dart';
import 'package:google_auth_68/wrapper.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensure all bindings are initialized
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return StreamProvider<User?>.value(
    //   initialData: null,
    //   value: AuthServices.firebaseUserStream,
    //   child: const MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     home: Wrapper(),
    //   ),
    // );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Firestore Demo"),
          backgroundColor: Colors.blue,
        ),
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: () {
                    DatabaseServices.createOrUpdateProduct(
                      "1",
                      name: "Masker",
                      price: 10000,
                    );
                  },
                  child: const Text(
                    "Add Data",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: () {
                    DatabaseServices.createOrUpdateProduct(
                      "1",
                      name: "Masker 2024",
                      price: 20000,
                    );
                  },
                  child: const Text(
                    "Edit Data",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: () async {
                    DocumentSnapshot snapshot =
                        await DatabaseServices.getProduct("1");
                    if (snapshot.exists) {
                      var data = snapshot.data() as Map<String, dynamic>;

                      // Akses data di sini
                      print("Product Name: ${data['name']}");
                      print("Product Price: ${data['price']}");
                    } else {
                      print("Document does not exist");
                    }
                  },
                  child: const Text(
                    "Get Data",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: () async {
                    await DatabaseServices.deleteProduct("1");
                  },
                  child: const Text(
                    "Delete Data",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
