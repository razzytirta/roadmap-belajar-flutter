import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
            title: const Text(
              'WhatsApp',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            bottom: const TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.message,
                    color: Colors.white,
                  ),
                  child: Text(
                    "Status",
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.white,
                    ),
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.call,
                    color: Colors.white,
                  ),
                  child: Text(
                    "Call",
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.white,
                    ),
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.people,
                    color: Colors.white,
                  ),
                  child: Text(
                    "Comunity",
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.white,
                    ),
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.chat_bubble,
                    color: Colors.white,
                  ),
                  child: Text(
                    "Chat",
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.white,
                    ),
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                  child: Text(
                    "Setting",
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              Center(
                child: Text('Pembaharuan'),
              ),
              Center(
                child: Text('Panggilan'),
              ),
              Center(
                child: Text('Komunitas'),
              ),
              Center(
                child: Text('Chat'),
              ),
              Center(
                child: Text('Pengaturan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
