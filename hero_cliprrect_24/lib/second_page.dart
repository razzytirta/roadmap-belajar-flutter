import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

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
          width: 200,
          height: 200,
          child: Hero(
            tag: 'pp',
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: const Image(
                fit: BoxFit.cover,
                image: NetworkImage(
                    "https://i.pinimg.com/originals/a4/d8/fd/a4d8fd58b6dbe055e23c8ffe36d4ba3a.jpg"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
