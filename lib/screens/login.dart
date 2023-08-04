import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final paswordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    paswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Assignment"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all()
                ),
                width: MediaQuery.of(context).size.width * .8,
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: "Email",
                    contentPadding: EdgeInsets.all(10)
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all()
                ),
                width: MediaQuery.of(context).size.width * .8,
                child: TextField(
                  controller: paswordController,
                  decoration: InputDecoration(
                    hintText: "Password",
                     contentPadding: EdgeInsets.all(10)
                  ),
                ),
              ),
            ),
            // ElevatedButton(onPressed: () {
            //   print(emailController.text);
            //   print(paswordController.text);
            //   FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text.trim(), password: paswordController.text.trim());
            // }, child: Text("Login")),
            ElevatedButton(
              onPressed: () async {
                try {
                  print(emailController.text);
                  print(paswordController.text);
                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: emailController.text.trim(),
                    password: paswordController.text.trim(),
                  );
                  // Login successful, navigate to the homepage.
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Homepage()),
                  );
                } catch (e) {
                  print('Error while signing in: $e');
                  // Handle the error appropriately, display a message to the user, etc.
                }
              },
              child: Text("Login"),
            ),

            ElevatedButton(
              onPressed: () async {
                try {
                  print(emailController.text);
                  print(paswordController.text);
                  await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: emailController.text.trim(),
                    password: paswordController.text.trim(),
                  );
                  // Sign-up successful, navigate to the homepage.
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Homepage()),
                  );
                } catch (e) {
                  print('Error while signing up: $e');
                  // Handle the error appropriately, display a message to the user, etc.
                }
              },
              child: Text("SignUp"),
            ),



            // ElevatedButton(onPressed: () {
            //
            //   FirebaseAuth.instance.createUserWithEmailAndPassword(email:  emailController.text.trim(), password:  paswordController.text.trim());
            //
            // }, child: Text("SignUp"))

          ],
        ),
      ),
    );
  }
}
