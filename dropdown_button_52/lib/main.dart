import 'package:flutter/material.dart';

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

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Person? selectedPerson;

  List<Person> persons = [Person(name: 'Razzi'), Person(name: 'Tirta')];

  List<DropdownMenuItem> generateItems(List<Person> persons) {
    List<DropdownMenuItem> items = [];
    for (var item in persons) {
      items.add(DropdownMenuItem(
        value: item,
        child: Text(item.name!),
      ));
    }

    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dropdown Button"),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            child: DropdownButton(
              isExpanded: true,
              style: const TextStyle(fontSize: 20, color: Colors.purple),
              value: selectedPerson,
              items: generateItems(persons),
              onChanged: (item) {
                setState(() {
                  selectedPerson = item;
                });
              },
            ),
          ),
          Text(
            (selectedPerson != null)
                ? selectedPerson!.name!
                : "Belum ada yang terpilih",
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}

class Person {
  String? name;
  Person({this.name});
}
