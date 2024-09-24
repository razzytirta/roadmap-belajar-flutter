import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_bloc_multi_page_app_51/bloc/color_bloc.dart';
import 'package:multi_bloc_multi_page_app_51/bloc/counter_bloc.dart';
import 'package:multi_bloc_multi_page_app_51/ui/draft_page.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorBloc, Color>(
      builder: (context, color) => DraftPage(
        backgroundColor: color,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BlocBuilder<CounterBloc, int>(
                builder: (context, number) => GestureDetector(
                  onTap: () =>
                      BlocProvider.of<CounterBloc>(context).add(number),
                  child: Text(
                    "$number",
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<ColorBloc>(context)
                          .add(ColorEvent.toPink);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink,
                      shape: (color == Colors.pink)
                          ? const CircleBorder(
                              side: BorderSide(color: Colors.black, width: 3))
                          : const CircleBorder(),
                    ),
                    child: const Icon(
                      Icons.circle,
                      color: Colors.white,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<ColorBloc>(context)
                          .add(ColorEvent.toAmber);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      shape: (color == Colors.amber)
                          ? const CircleBorder(
                              side: BorderSide(color: Colors.black, width: 3))
                          : const CircleBorder(),
                    ),
                    child: const Icon(
                      Icons.circle,
                      color: Colors.white,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<ColorBloc>(context)
                          .add(ColorEvent.toPurple);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      shape: (color == Colors.purple)
                          ? const CircleBorder(
                              side: BorderSide(color: Colors.black, width: 3))
                          : const CircleBorder(),
                    ),
                    child: const Icon(
                      Icons.circle,
                      color: Colors.white,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
