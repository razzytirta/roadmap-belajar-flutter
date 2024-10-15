import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  MainPage({super.key});
  final List<Person> persons = [
    Person('Doni', 47),
    Person('Catur', 28),
    Person('Tirta', 26),
    Person('Dimas', 20),
  ];

  @override
  Widget build(BuildContext context) {
    List<Person> sortedPersons = persons
      ..sort(
        (a, b) => a.name.compareTo(b.name),
      );
    List<List<Person>> groupsOfTwo = sortedPersons.chunked(2);
    Map<String, List<Person>>? groupByAge =
        sortedPersons.groupBy((element) => element.age < 40 ? 'young' : 'old');
    DateTime twentyThreeMinutesAgo =
        DateTime.now().subtract(const Duration(minutes: 23));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff990000),
        title: Text(
          "Supercharge Demo",
          style: GoogleFonts.poppins(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 3),
              child: Text(
                "List Person:",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff990000),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: sortedPersons
                  .map((e) => Text(
                        "> ${e.name} [${e.age}]",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ))
                  .toList(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 3),
              child: Text(
                'Age of the Oldest:',
                style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff990000)),
              ),
            ),
            Text(
              "${persons.map((e) => e.age).reduce(
                    (value, element) => value > element ? value : element,
                  )} years old",
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 3),
              child: Text(
                "Average age",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff990000),
                ),
              ),
            ),
            Text(
              "${persons.map((e) => e.age).reduce(
                    (value, element) => value + element,
                  ) / persons.length} years old",
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 3),
              child: Text(
                "Groups of 2:",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff990000),
                ),
              ),
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: groupsOfTwo[0]
                      .map(
                        (e) => Text(
                          "> ${e.name} [${e.age}]",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(
                  width: 40,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: groupsOfTwo[1]
                      .map(
                        (e) => Text(
                          "> ${e.name} [${e.age}]",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 3),
              child: Text(
                "Groups By age:",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff990000),
                ),
              ),
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: groupByAge['young']!
                      .map(
                        (e) => Text(
                          "> ${e.name} [${e.age}]",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(
                  width: 40,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: groupByAge['old']!
                      .map(
                        (e) => Text(
                          "> ${e.name} [${e.age}]",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 3),
              child: Text(
                "This time:",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff990000),
                ),
              ),
            ),
            Text(
              "${DateTime.now().hour} : ${DateTime.now().minute}",
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 15,
                bottom: 3,
              ),
              child: Text(
                "23 minutes ago:",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff990000),
                ),
              ),
            ),
            Text(
              "${twentyThreeMinutesAgo.hour} : ${twentyThreeMinutesAgo.minute}",
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Person {
  String name;
  int age;

  Person(this.name, this.age);
}

extension ListChunked<T> on List<T> {
  List<List<T>> chunked(int chunkSize) {
    List<List<T>> chunks = [];

    for (int i = 0; i < length; i += chunkSize) {
      int end = (i + chunkSize < length) ? i + chunkSize : length;
      chunks.add(sublist(i, end));
    }

    return chunks;
  }
}

extension ListGroupBy<T> on List<T> {
  Map<K, List<T>> groupBy<K>(K Function(T) keyFunction) {
    Map<K, List<T>> groups = {};
    for (var element in this) {
      var key = keyFunction(element);
      if (groups.containsKey(key)) {
        groups[key]!.add(element);
      } else {
        groups[key] = [element];
      }
    }
    return groups;
  }
}
