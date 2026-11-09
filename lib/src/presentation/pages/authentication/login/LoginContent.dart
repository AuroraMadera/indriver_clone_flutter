import 'package:flutter/material.dart';

class LoginContent extends StatelessWidget {
  const LoginContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height:MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Color.fromARGB(255,21,152,213),
          margin: EdgeInsets.only(left: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, //Horizontal
            mainAxisAlignment: MainAxisAlignment.center, //Vertical
            children: [
              RotatedBox(
                quarterTurns: 1, //Rotación del texto
                child: Text('Login',
                style: TextStyle(
                  fontSize: 27,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                ),
              ),
              SizedBox(height:50),
              RotatedBox(
                quarterTurns: 1, //Rotación del texto
                child: Text('Registro',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
                ),
              ),
              SizedBox(height:90),

            ],
          )
        ),
        Container(
          margin: EdgeInsets.only(left:60, bottom: 60),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 25, 181, 254),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              bottomRight: Radius.circular(35)
            ),
          ),
          child: Container(
            margin: EdgeInsets.only(left: 25, right: 25),
            child: Column (
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50),
                Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'back...',
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: Image.asset('assets/img/car_white.png',
                  width: 150,
                  height: 150,
                  ),
                ),
                Text(
                  'Log in',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                 TextFormField(
                  decoration: InputDecoration(
                    label: Text('Email'),
                    prefixIcon: Icon(
                      Icons.email
                    )
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    label: Text('Password'),
                    prefixIcon: Icon(
                      Icons.email
                    )
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 30),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                    child: Text(
                      'Iniciar sesión',
                      style: TextStyle(
                        color: Colors.cyan
                      ),
                    )
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}