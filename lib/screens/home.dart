import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../api_services/ApiService.dart';
import 'addData.dart';
import 'login.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  final ApiService apiService = ApiService(apiUrl: 'https://jsonplaceholder.typicode.com/posts');
  late Future<List<dynamic>> dataFuture;

  void signUserOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      print("Sign-out successful");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    } catch (e) {
      print("Error during sign-out: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    dataFuture = apiService.fetchData();

  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Data"),
        //leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage())),),
        actions: [
          IconButton(onPressed: () => signUserOut(context), icon: const Icon(Icons.logout))

        ],
      ),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> PostScreen())),
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
    );
  }
}
