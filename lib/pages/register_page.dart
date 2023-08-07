import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:phobapp/components/mybutton.dart';
import 'package:phobapp/components/textfields.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final fullNameController = TextEditingController();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final confrimPasswordController = TextEditingController();

  void displayMessage(String tex) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(tex),
            ));
  }

  Future adduserdetails(String fname, String uname) async {
    await FirebaseFirestore.instance
        .collection('users')
        .add({'fullname': fname, 'username': uname});
  }

  void registerMe() async {
    showDialog(
        context: context,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));

    if (passwordController.text != confrimPasswordController.text) {
      Navigator.pop(context);
      displayMessage("password didn't match");
      return;
    }
    if (context.mounted) {
      Navigator.pop(context);
    }
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text)
          .then((value) {
        User? user = FirebaseAuth.instance.currentUser;
        FirebaseFirestore.instance.collection("users").doc(user!.uid).set({
          'email': user.email,
          'fullname': fullNameController.text.trim(),
          'username': userNameController.text.trim()
        });
      });
    } on FirebaseAuthException catch (e) {
      // ignore: avoid_print
      Navigator.pop(context);
      displayMessage(e.code);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        
        body: Center(
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
                  controller: fullNameController,
                  hintText: 'Enter your fullname',
                  obscureText: false),
              const SizedBox(
                height: 25,
              ),
              MyTextField(
                  controller: userNameController,
                  hintText: 'Enter a username',
                  obscureText: false),
              const SizedBox(
                height: 25,
              ),
              MyTextField(
                  controller: emailController,
                  hintText: 'Enter your email id',
                  obscureText: false),
              const SizedBox(
                height: 25,
              ),
              MyTextField(
                  controller: passwordController,
                  hintText: 'Enter your password',
                  obscureText: false),
              const SizedBox(
                height: 25,
              ),
              MyTextField(
                  controller: confrimPasswordController,
                  hintText: 'Confirm your password',
                  obscureText: false),
              const SizedBox(
                height: 25,
              ),
              MyButton(text: "Register", onTap: registerMe),
              const SizedBox(
                height: 25,
              ),
              GestureDetector(
                  onTap: widget.onTap,
                  child: const Text("Already have an account, Sign in")),
            ],
          ),
        ),
      ),
    );
  }
}
