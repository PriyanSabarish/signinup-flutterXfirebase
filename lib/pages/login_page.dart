import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:phobapp/components/mybutton.dart';
import 'package:phobapp/components/textfields.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  void sigin() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    } on FirebaseAuthException catch (e) {
      // ignore: avoid_print
      print(e.code);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  "Phobo",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 50,
                ),
                const Text("Welcome back, You've been missed"),
                const SizedBox(
                  height: 25,
                ),
                MyTextField(
                    controller: emailController,
                    hintText: 'enter your email id',
                    obscureText: false),
                const SizedBox(
                  height: 25,
                ),
                MyTextField(
                    controller: passwordController,
                    hintText: 'enter your password',
                    obscureText: false),
                const SizedBox(
                  height: 25,
                ),
                MyButton(text: "Sigin", onTap: sigin),
                const SizedBox(
                  height: 25,
                ),
                GestureDetector(
                    onTap: widget.onTap,
                    child: const Text("Don't have an account, Sign up")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
