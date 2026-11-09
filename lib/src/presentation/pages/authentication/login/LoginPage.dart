import 'package:flutter/material.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/authentication/login/LoginContent.dart';

class LoginPage extends StatefulWidget {
  const new({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: const Color.fromARGB(255, 25, 181, 254),
      body: LoginContent()
    );
  }
}