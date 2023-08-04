import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/postModelPage.dart';


class ApiService {

  static String errorLogout = "Logout";
  static String Error_Msg = "Something went wrong. Please try again!!!";

  final String apiUrl;

  ApiService({required this.apiUrl});

  Future<List<dynamic>> fetchData() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to fetch data');
    }
  }




  // Future<String> postJsonData(String title,String body, userId) async {
  //   var client = http.Client();
  //   var uri = Uri.parse("https://jsonplaceholder.typicode.com/posts");
  //   var response = await client.post(uri,
  //       headers: {
  //         'Content-type': 'application/json; charset=UTF-8',
  //       },
  //       body: {
  //         title: title,
  //         body: body,
  //         userId: userId,
  //       });
  //   print(
  //       "calculate : ${response.statusCode} :  ${response.request} : ${response.body} :${response.toString()} :");
  //   if (response.statusCode == 200) {
  //     return response.body;
  //   }
  //   if (response.statusCode == 403) {
  //     return errorLogout;
  //   } else {
  //     return Error_Msg;
  //   }
  // }

  // static const String baseUrl = 'https://jsonplaceholder.typicode.com';
  //
  // Future<Map<String, dynamic>> postData(Map<String, dynamic> data) async {
  //   final response = await http.post(
  //     Uri.parse('$baseUrl/posts'),
  //     body: data,
  //   );
  //
  //   if (response.statusCode == 201) {
  //     return json.decode(response.body);
  //   } else {
  //     throw Exception('Failed to post data');
  //   }
  // }

  static const String baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<List<Post>> getPosts() async {
    final response = await http.get(Uri.parse('$baseUrl/posts'));

    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      return responseData.map((json) => Post.fromJson(json)).toList();
    } else {
      throw Exception('Failed to get posts');
    }
  }
  Future<Post> addPost(Post post) async {
    final response = await http.post(
      Uri.parse('$baseUrl/posts'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(post.toJson()),
    );

    if (response.statusCode == 201) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      return Post.fromJson(responseData);
    } else {
      throw Exception('Failed to add post');
    }
  }
}

