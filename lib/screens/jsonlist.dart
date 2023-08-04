import 'package:first_flutter/screens/home.dart';
import 'package:flutter/material.dart';

import '../api_services/ApiService.dart';

class JsonListData extends StatefulWidget {
  const JsonListData({super.key});

  @override
  State<JsonListData> createState() => _JsonListDataState();
}

class _JsonListDataState extends State<JsonListData> {

  final ApiService apiService = ApiService(apiUrl: 'https://jsonplaceholder.typicode.com/posts');
  late Future<List<dynamic>> dataFuture;

  @override
  void initState() {
    super.initState();
    dataFuture = apiService.fetchData();

  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text('API Data Display'), leading: IconButton( onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> Homepage())),icon: Icon(Icons.arrow_back),),),
      body: FutureBuilder<List<dynamic>>(
        future: dataFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error fetching data'));
          } else {
            final data = snapshot.data;
            return ListView.builder(
              itemCount: data!.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.all(10),
                  elevation: 5,
                  child: ListTile(
                    title: Container(child: Text(data[index]['title'])),
                    subtitle: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(data[index]['body']),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),

    );
  }
}
