import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class User {
  String? id;
  String? name;

  User({this.id, this.name});

  factory User.createUser(Map<String, dynamic> object) {
    return User(
      id: object['id']?.toString(),
      name: (object['first_name'] ?? '') + (object['last_name'] ?? ''),
    );
  }

  static Future<User> connectToAPI(String id) async {
    String apiURL = "https://reqres.in/api/users/$id";

    var apiResult = await http.get(Uri.parse(apiURL));

    var jsonObject = json.decode(apiResult.body);

    var userData = (jsonObject as Map<String, dynamic>)['data'];

    return User.createUser(userData);
  }

  static Future<List<User>> getAllUsers(String page) async {
    try {
      String apiUrl = "https://reqres.in/api/users?page=$page";
      var apiResult = await http.get(Uri.parse(apiUrl));

      if (apiResult.statusCode == 200) {
        var jsonObject = json.decode(apiResult.body);
        List<dynamic> listUser = (jsonObject as Map<String, dynamic>)['data'];

        List<User> users = [];
        for (var i = 0; i < listUser.length; i++) {
          users.add(User.createUser(listUser[i]));
        }

        return users;
      } else {
        return []; // Return an empty list instead of null
      }
    } catch (e) {
      print('Error occurred: $e');
      return []; // Return an empty list in case of an error
    }
  }
}
