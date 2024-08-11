import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    TabBar tabBar = const TabBar(
      indicator: BoxDecoration(
        color: Colors.amber,
        border: Border(
          top: BorderSide(
            color: Colors.white,
            width: 5,
          ),
        ),
      ),
      tabs: [
        Tab(
          icon: Icon(
            Icons.home,
          ),
          text: "Home",
        ),
        Tab(
          icon: Icon(
            Icons.settings,
          ),
          text: "Settings",
        ),
      ],
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
            title: const Text(
              "Custom Appbar",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            centerTitle: true,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(tabBar.preferredSize.height),
              child: Container(
                child: tabBar,
              ),
            ),
          ),
          body: const TabBarView(
            children: [
              Center(
                child: Text('Home'),
              ),
              Center(
                child: Text('Setting'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
