import 'dart:convert';

import 'package:http/http.dart';

class HttpHelper {
  static const fetchLimit = 15;
  static String baseUrl = 'https://jsonplaceholder.typicode.com/posts';

  static Future<List<dynamic>> fetchPosts(int page) async {
    try {
      final response =
          await get(Uri.parse("$baseUrl?_limit=$fetchLimit&_page=$page"));
      return jsonDecode(response.body) as List<dynamic>;
    } catch (err) {
      print(err);
      return [];
    }
  }

  static Future<List<dynamic>> fetchPostsComments(int page) async {
    try {
      final response = await get(
          Uri.parse("$baseUrl/$page/comments?_page=$page&_limit=$fetchLimit&"));
      return jsonDecode(response.body) as List<dynamic>;
    } catch (err) {
      print(err);
      return [];
    }
  }
}
