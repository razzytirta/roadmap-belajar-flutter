import 'dart:math';

import 'package:flutter/material.dart';
import 'package:widget_slider_59/ui/widgets/movie_box.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController controller =
      PageController(initialPage: 0, viewportFraction: 0.6);
  List<String> urls = [
    "https://cdns.klimg.com/resized/476x/p/perempuan-berkalung-surban-revalina.jpg",
    "https://cdns.klimg.com/resized/476x/p/5-cm-film-indonesia.jpg",
    "https://cdns.klimg.com/resized/476x/p/butterfly-film-indonesia.jpg",
    "https://cdns.klimg.com/resized/476x/p/garuda-di-dadaku-2-film-indonesia.jpg",
    "https://cdns.klimg.com/resized/476x/p/jermal-film-indonesia.jpg",
    "https://cdns.klimg.com/resized/476x/p/sang-pemimpi.jpg"
  ];
  double currentPageValue = 0;

  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      setState(() {
        setState(() {
          currentPageValue = controller.page!;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text(
          "Widget Slider",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: PageView.builder(
          controller: controller,
          itemCount: urls.length,
          itemBuilder: (context, index) {
            double difference = index - currentPageValue;
            if (difference < 0) {
              difference *= -1;
            }
            difference = min(1, difference);
            return Center(
              child: MovieBox(
                url: urls[index],
                scale: 1 - (difference * 0.3),
              ),
            );
          }),
    );
  }
}
