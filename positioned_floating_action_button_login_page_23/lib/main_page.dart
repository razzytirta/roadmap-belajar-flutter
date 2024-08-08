import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  double getsSmallDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 2 / 3;
  double getsBigDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 7 / 8;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEEEEE),
      body: Stack(
        children: [
          Positioned(
            right: -getsSmallDiameter(context) / 3,
            top: -getsSmallDiameter(context) / 3,
            child: Container(
              width: getsSmallDiameter(context),
              height: getsSmallDiameter(context),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    Color(
                      0xFFB226B2,
                    ),
                    Color(0xFFFF6DA7)
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          Positioned(
            left: -getsBigDiameter(context) / 4,
            top: -getsBigDiameter(context) / 4,
            child: Container(
              width: getsBigDiameter(context),
              height: getsBigDiameter(context),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    Color(
                      0xFFB226B2,
                    ),
                    Color(0xFFFF6DA7)
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: const Center(
                child: Text(
                  'Dribble',
                  style: TextStyle(
                    fontFamily: "Pacifico",
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: -getsBigDiameter(context) / 2,
            bottom: -getsBigDiameter(context) / 2,
            child: Container(
              width: getsBigDiameter(context),
              height: getsBigDiameter(context),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    Color(
                      0xFFB226B2,
                    ),
                    Color(0xFFFF6DA7)
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          Positioned(
            left: -getsSmallDiameter(context) / 2,
            bottom: -getsSmallDiameter(context) / 2,
            child: Container(
              width: getsSmallDiameter(context),
              height: getsSmallDiameter(context),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    Color(
                      0xFFB226B2,
                    ),
                    Color(0xFFFF6DA7)
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ListView(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(5)),
                  margin: const EdgeInsets.fromLTRB(
                    20,
                    300,
                    20,
                    10,
                  ),
                  padding: const EdgeInsets.fromLTRB(
                    10,
                    0,
                    10,
                    25,
                  ),
                  child: const Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.email,
                            color: Color(0xFFFF4891),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFFF4891),
                            ),
                          ),
                          labelText: "Email :",
                          labelStyle: TextStyle(
                            color: Color(0xFFFF4891),
                          ),
                        ),
                      ),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.vpn_key,
                            color: Color(0xFFFF4891),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFFF4891),
                            ),
                          ),
                          labelText: "Password :",
                          labelStyle: TextStyle(
                            color: Color(0xFFFF4891),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 20, 20),
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Color(0xFFFF4891),
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: 40,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: const LinearGradient(
                                colors: [
                                  Color(
                                    0xFFB226B2,
                                  ),
                                  Color(0xFFFF6DA7)
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              )),
                          child: Material(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {},
                              borderRadius: BorderRadius.circular(20),
                              splashColor: Colors.green,
                              child: const Center(
                                child: Text(
                                  'Sign In',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Pacifico",
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      FloatingActionButton(
                        onPressed: () {},
                        mini: true,
                        elevation: 0,
                        child: const Image(
                          image: AssetImage('assets/images/facebook.png'),
                        ),
                      ),
                      FloatingActionButton(
                        onPressed: () {},
                        mini: true,
                        elevation: 0,
                        child: const Image(
                          image: AssetImage('assets/images/google.png'),
                        ),
                      ),
                    ],
                  ),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't Have an Account? ",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "Sign Up ",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFFFF4891),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
