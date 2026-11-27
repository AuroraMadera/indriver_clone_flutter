import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/authentication/login/bloc/LoginBloc.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/authentication/login/bloc/LoginEvent.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/authentication/login/bloc/LoginState.dart';
import 'package:indriver_clone_flutter/src/presentation/utils/BlocFormItem.dart';
import 'package:indriver_clone_flutter/src/presentation/widgets/DefaultButton.dart';
import 'package:indriver_clone_flutter/src/presentation/widgets/DefaultTextField.dart';


class LoginContent extends StatelessWidget {

  LoginState state;

  LoginContent(this.state);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: state.formKey,
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 12, 38, 145),
                Color.fromARGB(255, 34, 156, 249),
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
            ),
            padding: EdgeInsets.only(left: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Horizontal
              mainAxisAlignment: MainAxisAlignment.center, // Vertical
              children: [
                _textLoginRotated(),
                SizedBox(height: 50),
                _textRegisterRotated(context),
                SizedBox(height: 90),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            margin: EdgeInsets.only(left: 60, bottom: 60),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 14, 29, 166),
                  Color.fromARGB(255, 30, 112, 227),
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                bottomRight: Radius.circular(35),
              ),
            ),
            child: Container(
              margin: EdgeInsets.only(left: 25, right: 25),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 50),
                    _textWelcome('Welcome'),
                    _textWelcome('back...'),
                    _imageCar(),
                    _textLogin(),
                    DefaultTextField(
                      onChanged: (text){
                        context.read<LoginBloc>().add(EmailChanged(email: BlocFormItem(value: text)));
                      },
                      validator: (value){
                        return state.email.error;
                      },
                      text: 'Email',
                      icon: Icons.email_outlined,
                    ),
                    DefaultTextField(
                      onChanged: (text){
                        context.read<LoginBloc>().add(PasswordChanged(password: BlocFormItem(value:text)));
                      },
                      validator: (value){
                        return state.password.error;
                      },
                      text: 'Password',
                      icon: Icons.lock_outline,
                      margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                    ),
                    // Spacer(),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                    DefaultButton(
                      text: 'Log in',
                      onPressed: (){
                        if(state.formKey!.currentState!.validate()){
                        context.read<LoginBloc>().add(FormSubmit());
                        } 
                        else{
                          print('The form is not valid');
                        }
                      }
                    ),
                    _separatorOr(),
                    SizedBox(height: 10),
                    _textDontHaveAccount(context),
                    SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _textDontHaveAccount(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '¿No tienes cuenta?',
          style: TextStyle(
            color: Colors.grey[100],
            fontSize: 17,
          ),
        ),
        SizedBox(width: 7),
          GestureDetector(
            onTap: () {
              // Navegar a la página de registro
              Navigator.pushNamed(context, 'register');
            },
          child: Text(
            'Regístrate',
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
            ),
          ),
        ),
      ],
    );
  }

  Widget _separatorOr(){
    return Row( 
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 25,
            height: 1,
            color: Colors.white,
            margin: EdgeInsets.only(right: 5),
          ),
          Text(
            'O',
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
            ),
          ),
          Container(
            width: 25,
            height: 1,
            color: Colors.white,
            margin: EdgeInsets.only(left: 5),
          ), 
      ],
    );
  }

  Widget _textLogin(){
    return Text(
      'Inicia Sesión',
      style: TextStyle(
        fontSize: 24,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _imageCar(){
    return Container(
      alignment: Alignment.centerRight,
      child: Image.asset(
        'assets/img/car_white.png',
        width: 150,
        height: 150,
      ),
    );
  }

  Widget _textWelcome(String text){
    return Text(
      text,
      style: TextStyle(
        fontSize: 30,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _textRegisterRotated(BuildContext context){
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'register');
      },
      child: RotatedBox(
        quarterTurns: 1, // Rotación del texto
        child: Text(
          'Registro',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
  // _ porque es privado
  Widget _textLoginRotated(){
    return RotatedBox(
      quarterTurns: 1, // Rotación del texto
      child: Text(
        'Login',
        style: TextStyle(
          fontSize: 27,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
