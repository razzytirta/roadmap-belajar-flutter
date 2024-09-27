import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_list_with_bloc_54/bloc/post_bloc.dart';
import 'package:infinite_list_with_bloc_54/ui/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider<PostBloc>(
        create: (context) => PostBloc()..add(LoadPosts()),
        child: const MainPage(),
      ),
    );
  }
}
