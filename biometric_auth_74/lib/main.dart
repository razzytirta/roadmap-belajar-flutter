import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_auth/local_auth.dart';

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

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isAvailable = false;
  bool isAuthenticated = false;
  String text = 'Please check Biometric Availabilty';
  LocalAuthentication localAuthentication = LocalAuthentication();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Biometric Authentication"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: 200,
              margin: const EdgeInsets.only(bottom: 6),
              child: ElevatedButton(
                onPressed: () async {
                  isAvailable = await localAuthentication.canCheckBiometrics;
                  if (isAvailable) {
                    List<BiometricType> types =
                        await localAuthentication.getAvailableBiometrics();
                    text = "Biometrics Availables";
                    for (var item in types) {
                      text += "\n- $item";
                    }
                    setState(() {
                      print(text);
                    });
                  } else {
                    print("Biometrics are not available");
                  }
                },
                child: Text(
                  "Checks Biometrics",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                ),
              ),
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: isAvailable
                    ? () async {
                        isAuthenticated =
                            await localAuthentication.authenticate(
                          localizedReason: "Please Authenticate",
                          options: const AuthenticationOptions(
                            stickyAuth: true,
                            useErrorDialogs: true,
                          ),
                        );
                        setState(() {});
                      }
                    : null,
                child: Text(
                  "Authenticate",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isAuthenticated ? Colors.green : Colors.red,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 3,
                    spreadRadius: 2,
                  )
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 2,
              color: Colors.grey[200],
              child: Center(
                child: Text(
                  text,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
