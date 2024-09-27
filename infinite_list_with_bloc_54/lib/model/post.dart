import 'dart:convert';
import 'package:http/http.dart' as http;

class Post {
  String? id;
  String? title;
  String? body;

  Post({this.id, this.title, this.body});

  // Factory constructor is optional since you are already mapping in the connectToAPI method
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'].toString(),
      title: json['title'],
      body: json['body'],
    );
  }

  static Future<List<Post>> connectToAPI(int start, int limit) async {
    final String response =
        "https://jsonplaceholder.typicode.com/posts?_start=$start&_limit=$limit";

    try {
      final result = await http.get(Uri.parse(response));

      if (result.statusCode == 200) {
        var jsonObject = json.decode(result.body) as List;
        return jsonObject.map<Post>((item) => Post.fromJson(item)).toList();
      } else {
        throw Exception("Failed to load posts");
      }
    } catch (e) {
      throw Exception("Network error: $e");
    }
  }
}
