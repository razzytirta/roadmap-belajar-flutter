import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_53/model/monster.dart';
import 'package:hive_flutter/adapters.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Hive Database',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder(
        future: Hive.openBox("monsters"),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(
                child: Text("${snapshot.error}"),
              );
            } else {
              var monstersBox = Hive.box("monsters");
              if (monstersBox.length == 0) {
                monstersBox.add(Monster("Vampire", 1));
                monstersBox.add(Monster("Jelly Guaradian", 5));
              }
              return ValueListenableBuilder(
                valueListenable: monstersBox.listenable(),
                builder: (context, monsters, _) => Container(
                  margin: const EdgeInsets.all(20),
                  child: ListView.builder(
                    itemCount: monsters.length,
                    itemBuilder: (context, index) {
                      Monster monster = monsters.getAt(index);
                      return Container(
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.only(bottom: 10),
                        decoration:
                            BoxDecoration(color: Colors.white, boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            offset: const Offset(3, 3),
                            blurRadius: 6,
                          ),
                        ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${monster.name} [${monster.level}]",
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    monsters.putAt(
                                      index,
                                      Monster(monster.name, monster.level + 1),
                                    );
                                  },
                                  icon: const Icon(Icons.trending_up),
                                  color: Colors.green,
                                ),
                                IconButton(
                                  onPressed: () {
                                    monsters.add(
                                        Monster(monster.name, monster.level));
                                  },
                                  icon: const Icon(Icons.content_copy),
                                  color: Colors.amber,
                                ),
                                IconButton(
                                  onPressed: () {
                                    monsters.deleteAt(index);
                                  },
                                  icon: const Icon(Icons.delete),
                                  color: Colors.red,
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              );
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
