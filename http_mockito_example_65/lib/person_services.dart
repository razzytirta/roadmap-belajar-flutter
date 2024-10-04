import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http_mockito_example_65/person.dart';

class PersonServices {
  static Future<Person> getPersonById(String id, http.Client client) async {
    String url = "http://localhost/persons/$id";

    var response = await client.get(Uri.parse(url));
    if (response.statusCode != 200) {
      throw Exception("Gagal mengambil data");
    }
    var result = json.decode(response.body);

    return Person.fromJson(result);
  }
}
