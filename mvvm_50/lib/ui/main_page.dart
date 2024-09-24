import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_50/bloc/user_bloc.dart';
import 'package:mvvm_50/ui/user_card.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  final Random random = Random();

  @override
  Widget build(BuildContext context) {
    final UserBloc bloc = context.read<UserBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("MVVM"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey),
            onPressed: () {
              bloc.add(FetchUser(random.nextInt(10) + 1));
            },
            child: const Text(
              "Pick Random User",
              style: TextStyle(color: Colors.white),
            ),
          ),
          BlocBuilder<UserBloc, UserState>(builder: (context, state) {
            if (state is UserLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is UserLoaded) {
              return UserCard(
                user: state.user,
              );
            } else if (state is UserError) {
              return Center(
                child: Text(state.message),
              );
            } else {
              return Container();
            }
          })
        ],
      ),
    );
  }
}
