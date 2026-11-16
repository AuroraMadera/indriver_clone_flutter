import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {

  String text;
  Color color;
  Color textColor;

   DefaultButton({
    required this.text,
    this.color = Colors.white,
    this.textColor = Colors.black
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: MediaQuery.of(context).size.width,
      //alignment: Alignment.center,
      margin: EdgeInsets.only(bottom: 20, left: 40, right: 40),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
        ),
        child: Text(
          'Iniciar sesion',
          style: TextStyle(
            color: textColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}