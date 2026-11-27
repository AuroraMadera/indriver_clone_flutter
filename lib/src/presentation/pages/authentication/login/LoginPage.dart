import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/authentication/login/LoginContent.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/authentication/login/bloc/LoginBloc.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/authentication/login/bloc/LoginState.dart';

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
      body: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return LoginContent(state);
        },
      ),
    );
  }
}
