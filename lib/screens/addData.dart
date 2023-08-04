
import 'package:first_flutter/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/postProvider.dart';

class PostScreen extends StatefulWidget {
  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();
  final TextEditingController _idController = TextEditingController();

  void addPost() {
    final title = _titleController.text;
    final body = _bodyController.text;

    Provider.of<PostDataModelProvider>(context, listen: false).addPost(title, body);

    _titleController.clear();
    _bodyController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final posts = Provider.of<PostDataModelProvider>(context).posts;
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Post'),
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> Homepage())),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: _bodyController,
              decoration: InputDecoration(labelText: 'Body'),
            ),
            TextField(
              controller: _idController,
              decoration: InputDecoration(labelText: 'Ui1'),
            ),
            ElevatedButton(
              onPressed: () {
                addPost();
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
              child: Text('Add Post'),
            ),


            Expanded(
              child: ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text(posts[index].title),
                      subtitle: Text(posts[index].body),
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