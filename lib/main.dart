import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:first_flutter/provider/postProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'api_services/ApiService.dart';
import 'screens/home.dart';
import 'screens/login.dart';

void main() async {
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        Provider<ApiService>(
          create: (_) => ApiService(apiUrl: ''),
        ),
        ChangeNotifierProvider<PostDataModelProvider>(
          create: (context) => PostDataModelProvider(
            apiService: Provider.of<ApiService>(context, listen: false),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:  StreamBuilder<User?> (
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot){
              print("Auth state changed: ${snapshot.connectionState}");
              if (snapshot.connectionState == ConnectionState.active){
                if(snapshot.hasData) {
                  return Homepage();
                } else {
                  return  LoginPage();
                }
              }
              return CircularProgressIndicator();

            }
        ),
      )
    );



      
  }
}
