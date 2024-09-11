import 'package:bloc_state_management_flutter_package_42/color_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => ColorBloc(),
        child: const MainPage(),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<ColorBloc>().add(ColorEvent.toAmber);
            },
            backgroundColor: Colors.amber,
            tooltip: 'Change to Amber',
            child: const Icon(Icons.circle),
          ),
          const SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: () {
              context.read<ColorBloc>().add(ColorEvent.toLightBlue);
            },
            backgroundColor: Colors.lightBlue,
            tooltip: 'Change to Light Blue',
            child: const Icon(Icons.circle),
          ),
        ],
      ),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('BLoC menggunakan flutter package'),
      ),
      body: Center(
        child: BlocBuilder<ColorBloc, Color>(builder: (context, color) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            width: 100,
            height: 100,
            color: color,
          );
        }),
      ),
    );
  }
}
