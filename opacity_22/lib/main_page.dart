import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Custom Card Example",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF8C062F),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFFE5788),
                  Color(0xFFF56D5D),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.7,
              child: Card(
                elevation: 10,
                child: Stack(
                  children: [
                    Opacity(
                      opacity: 0.7,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          image: const DecorationImage(
                            image: NetworkImage(
                              "https://www.toptal.com/designers/subtlepatterns/uploads/memphis-mini.png",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.35,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(4),
                          topRight: Radius.circular(4),
                        ),
                        image: DecorationImage(
                            image: NetworkImage(
                              "https://pixabay.com/get/g4e6be20e6a130d75c61e8d2051d7efcc504f8a1cc634f23b8b14aa15861e7fae05ddf2d780910e8833b3a4620c92795b19f5a560fadb89ce7f74348c7f62b4ec_1280.jpg",
                            ),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(
                        20,
                        50 + MediaQuery.of(context).size.height * 0.35,
                        20,
                        20,
                      ),
                      child: Center(
                        child: Column(
                          children: [
                            const Text(
                              "Beautiful Sunset at Paddy Field",
                              style: TextStyle(
                                color: Color(
                                  0xFFF56D5D,
                                ),
                                fontSize: 25,
                              ),
                              maxLines: 2,
                              textAlign: TextAlign.center,
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(
                                0,
                                20,
                                0,
                                15,
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Post on ",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text(
                                    "August 6, 2024",
                                    style: TextStyle(
                                      color: Color(0xFFF56D5D),
                                      fontSize: 12,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const Row(
                              children: [
                                Spacer(
                                  flex: 10,
                                ),
                                Icon(
                                  Icons.thumb_up,
                                  size: 18,
                                  color: Colors.grey,
                                ),
                                Spacer(
                                  flex: 1,
                                ),
                                Text(
                                  "99",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                                Spacer(
                                  flex: 5,
                                ),
                                Icon(
                                  Icons.comment,
                                  size: 18,
                                  color: Colors.grey,
                                ),
                                Spacer(
                                  flex: 1,
                                ),
                                Text(
                                  "888",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                                Spacer(
                                  flex: 10,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
