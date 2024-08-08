import 'package:flutter/material.dart';
import 'package:hero_cliprrect_24/second_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          'Belajar Hero dan ClipRRect',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: SizedBox(
          width: 100,
          height: 100,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const SecondPage();
                  },
                ),
              );
            },
            child: Hero(
              tag: 'pp',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: const Image(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "https://i.pinimg.com/originals/a4/d8/fd/a4d8fd58b6dbe055e23c8ffe36d4ba3a.jpg"),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
