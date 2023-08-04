import 'dart:io';

import 'package:first_flutter/models/postModelPage.dart';
import 'package:flutter/material.dart';


class DetailPage extends StatefulWidget {
  final Post post;
  const DetailPage({super.key, required this.post,});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {





  @override
  Widget build(BuildContext context) {
    //final posts = Provider.of<PostDataModelProvider>(context).posts;
    return  Dialog(
      insetPadding: EdgeInsets.zero,
      child: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.2,
          maxWidth: MediaQuery.of(context).size.width * 0.9,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Title->", style: TextStyle(fontSize: 20),),
                const SizedBox(width: 10,),
                Text(widget.post.title),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Body->", style: TextStyle(fontSize: 20)),
                const SizedBox(width: 10,),
                Text(widget.post.body),
              ],
            ),
            ElevatedButton(onPressed: ()=> Navigator.pop(context), child: const Text("Close"))

          ],
        ),
      ),
    );

  }
}
