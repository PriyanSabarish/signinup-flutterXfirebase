import 'package:flutter/material.dart';
import 'package:phobapp/pages/login_page.dart';
import 'package:phobapp/pages/register_page.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool showLogin = true;
  void toogleScreens() {
    setState(() {
      showLogin = !showLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLogin) {
      return LoginPage(onTap: toogleScreens);
    } else {
      return RegisterPage(onTap: toogleScreens);
    }
 
  }
}
