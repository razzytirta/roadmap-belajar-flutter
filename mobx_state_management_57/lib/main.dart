import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_state_management_57/mobx/counter.dart';

final CounterMobx counterMobx = CounterMobx();

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

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MOBX State Management"),
        backgroundColor: Colors.grey,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Observer(
              builder: (context) => Text(
                "${counterMobx.value}",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 80),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  backgroundColor: Colors.grey,
                  shape: const CircleBorder(),
                  onPressed: () {
                    counterMobx.decrement();
                  },
                  child: const Icon(Icons.arrow_downward),
                ),
                const SizedBox(
                  width: 20,
                ),
                FloatingActionButton(
                  backgroundColor: Colors.grey,
                  shape: const CircleBorder(),
                  onPressed: () {
                    counterMobx.increment();
                  },
                  child: const Icon(Icons.arrow_upward),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
