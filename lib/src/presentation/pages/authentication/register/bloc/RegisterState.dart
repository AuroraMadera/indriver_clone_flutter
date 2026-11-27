import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:indriver_clone_flutter/src/presentation/utils/BlocFormItem.dart';

class RegisterState extends Equatable {

final BlocFormItem name;
final BlocFormItem lastname;
final BlocFormItem email;
final BlocFormItem phone;
final BlocFormItem password;
final BlocFormItem confirmPassword;
final GlobalKey<FormState>? formKey;

const RegisterState({
  this.name = const BlocFormItem(error: 'Enter the name'),
  this.lastname = const BlocFormItem(error: 'Enter the last name'),
  this.email = const BlocFormItem(error: 'Enter the email'),
  this.phone = const BlocFormItem(error: 'Enter the phone'),
  this.password = const BlocFormItem(error: 'Enter the password'),
  this.confirmPassword = const BlocFormItem(error: 'Enter the confirm the password'),
  this.formKey,
});

RegisterState copyWith({
  BlocFormItem? name,
  BlocFormItem? lastname,
  BlocFormItem? email,
  BlocFormItem? phone,
  BlocFormItem? password,
  BlocFormItem? confirmPassword,
  GlobalKey<FormState>?formKey
})  {
  return RegisterState(
    name: name ?? this.name,
    lastname: lastname ?? this.lastname,
    email: email ?? this.email,
    phone: phone ?? this.phone,
    password: password ?? this.password,
    confirmPassword: confirmPassword ?? this.confirmPassword,
    formKey : formKey

  );
}

@override
  List<Object?> get props => [name, lastname, email, phone, password, confirmPassword] ;

}