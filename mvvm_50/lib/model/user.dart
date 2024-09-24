import 'dart:convert';

import 'package:http/http.dart' as http;

class User {
  String? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  User({this.id, this.email, this.firstName, this.lastName, this.avatar});

  factory User.createUser(Map<String, dynamic> object) {
    return User(
      id: object["id"].toString(),
      email: object["email"],
      firstName: object["first_name"],
      lastName: object["last_name"],
      avatar: object["avatar"],
    );
  }

  static Future<User> getUserFromAPI(int id) async {
    String apiURL = "https://reqres.in/api/users/${id.toString()}";
    try {
      final response = await http.get(Uri.parse(apiURL));

      if (response.statusCode == 200) {
        var jsonObject = json.decode(response.body);
        var userData = (jsonObject as Map<String, dynamic>)["data"];

        if (userData != null) {
          return User.createUser(userData);
        } else {
          throw Exception('User data not found in the response.');
        }
      } else {
        throw Exception(
            'Failed to fetch user data. Status code : ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error fetching user: $error');
    }
  }
}

class UninitializedUser extends User {}
