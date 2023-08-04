
import 'dart:io';

import 'package:first_flutter/screens/detail.dart';
import 'package:first_flutter/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';

import '../provider/postProvider.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final LocalStorage userDetailsStorage = LocalStorage('local_storage');
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();
  bool activeConnection = false;



  void addPost() {
    final title = _titleController.text;
    final body = _bodyController.text;

    Provider.of<PostDataModelProvider>(context, listen: false).addPost(title, body);

    _titleController.clear();
    _bodyController.clear();
  }

  Future checkUserConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        setState(() {
          activeConnection = true;
          addPost();
        });
      }
    } on SocketException catch (_) {
      setState(() {
        activeConnection = false;
        Fluttertoast.showToast(
          msg: "Check your Internet connection",
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final posts = Provider.of<PostDataModelProvider>(context).posts;
    userDetailsStorage.setItem("post", posts);
    return Scaffold(
      appBar: AppBar(
        title:const Text('Add New Post'),
        leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> const Homepage())),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child: TextField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Title', contentPadding: EdgeInsets.all(10)),
              ),
            ),
            const SizedBox(height: 20,),
            Container(
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child: TextField(
                controller: _bodyController,
                decoration: const InputDecoration(labelText: 'Body', contentPadding: EdgeInsets.all(10)),
              ),
            ),

            ElevatedButton(
              onPressed: () {
                checkUserConnection();
                //addPost();
                // print(_titleController.text);
                // print(_bodyController.text);
                // print(_idController.text);
                // final postData = {
                //   'title': _titleController.text,
                //   'body': _bodyController.text,
                //   //'userId': _idController.text,
                // };
                //
                // final postProvider = Provider.of<PostDataModelProvider>(context, listen: false);
                // postProvider.addNewPost(postData);
              },
              child: const Text('Add Post'),
            ),


            Expanded(
              child: ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      showDialog(context: context, builder: (BuildContext context) {
                        return DetailPage(post : posts[index]);
                      });
                    },
                    child: Card(
                      color: Colors.white60,
                      margin: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text("Title-> ${posts[index].title}"),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}