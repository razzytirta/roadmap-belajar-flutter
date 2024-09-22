import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:hydrated_bloc_48/color_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  HydratedBloc.storage = storage; //
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
            shape: const CircleBorder(),
          ),
          const SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: () {
              context.read<ColorBloc>().add(ColorEvent.toLightBlue);
            },
            backgroundColor: Colors.blue,
            shape: const CircleBorder(),
          ),
        ],
      ),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          "Hydrated BloC",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: BlocBuilder<ColorBloc, Color>(
          builder: (context, state) => AnimatedContainer(
            duration: const Duration(
              milliseconds: 500,
            ),
            width: 100,
            height: 100,
            color: state,
          ),
        ),
      ),
    );
  }
}
