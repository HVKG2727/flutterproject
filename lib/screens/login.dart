import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Assignment"),
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
                  decoration: const InputDecoration(
                    hintText: "Email",
                    contentPadding: EdgeInsets.all(10)
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all()
                ),
                width: MediaQuery.of(context).size.width * .8,
                child: TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    hintText: "Password",
                     contentPadding: EdgeInsets.all(10)
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                  );

                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Homepage()));
                  Fluttertoast.showToast(msg: "Login Successfully");
                } catch (e) {
                  print('Error while signing in: $e');
                  Fluttertoast.showToast(msg: 'Error while signing in: $e');
                }
              },
              child: const Text("Login"),
            ),

            ElevatedButton(
              onPressed: () async {
                try {
                  print(emailController.text);
                  print(passwordController.text);
                  await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                  );
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Homepage()));
                  Fluttertoast.showToast(msg: 'SignUp successfully');

                } catch (e) {
                  print('Error while signingUp up: $e');
                  Fluttertoast.showToast(msg: 'Error while signingUp in: $e');

                }
              },
              child: const Text("SignUp"),
            ),

          ],
        ),
      ),
    );
  }
}
