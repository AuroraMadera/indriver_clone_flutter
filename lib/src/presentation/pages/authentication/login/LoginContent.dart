
import 'package:flutter/material.dart';
import 'package:indriver_clone_flutter/src/presentation/widgets/DefaultButton.dart';
import 'package:indriver_clone_flutter/src/presentation/widgets/DefaultTextField.dart';

class LoginContent extends StatelessWidget {
  const LoginContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
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
              _textRegisterRotated(),
              SizedBox(height: 90),
            ],
          ),
        ),
        Container(
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50),
                _textWelcome('Welcome'),
                _textWelcome('back...'),
                _imageCar(),
                _textLogin(),
                DefaultTextField(
                  text: 'Email',
                  icon: Icons.email_outlined,
                ),
                DefaultTextField(
                  text: 'Password',
                  icon: Icons.lock_outline,
                  margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                ),
                Spacer(),
                DefaultButton(
                  text: 'Iniciar sesion',
                  // color: Colors.white,
                  // textColor: Colors.black,
                ),
                _separatorOr(),
                SizedBox(height: 10),
                _textDontHaveAccount(),
                SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _textDontHaveAccount(){
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
        TextButton(
          onPressed: () {},
          child: Text(
            'Registrate',
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
      'Log in',
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

  Widget _textRegisterRotated(){
    return RotatedBox(
      quarterTurns: 1, // Rotación del texto
      child: Text(
        'Registro',
        style: TextStyle(
          fontSize: 24,
          color: Colors.white,
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
