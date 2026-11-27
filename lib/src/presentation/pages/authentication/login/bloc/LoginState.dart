import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:indriver_clone_flutter/src/presentation/utils/BlocFormItem.dart';

class LoginState extends Equatable{

  final BlocFormItem email;
  final BlocFormItem password;
  final GlobalKey<FormState>? formKey;

  const LoginState({
    this.email = const BlocFormItem(error: 'enter the email'),
    this.password= const BlocFormItem(error: 'enter the password'),
    this.formKey
  });

  LoginState copyWith({
    BlocFormItem? email,
    BlocFormItem? password,
    GlobalKey<FormState>? formKey,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      formKey: formKey
    );
  }

  @override
  List<Object?> get props => [email, password];

}