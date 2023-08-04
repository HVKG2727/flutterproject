


import 'package:first_flutter/screens/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../api_services/ApiService.dart';
import '../models/postModelPage.dart';

class PostDataModelProvider extends ChangeNotifier {

  final ApiService apiService;


  List<Post> _posts = [];

  List<Post> get posts => _posts;

  PostDataModelProvider({required this.apiService});

  Future<void> fetchPosts() async {
    try {
      _posts = await apiService.getPosts();
      notifyListeners();
    } catch (e) {
      print('Error fetching posts: $e');
    }
  }

  Future<void> addPost(String title, String body) async {
    if (title.isEmpty || body.isEmpty) {
      return;
    }

    try {
      Post newPost = await apiService.addPost(Post(
        id: -1, // Temporary ID, the API will assign a proper ID
        userId: 1, // Provide the user ID accordingly.
        title: title,
        body: body,
      ));

      _posts.insert(0, newPost);
      notifyListeners();
    } catch (e) {
      print('Error adding post: $e');
    }
  }
}
