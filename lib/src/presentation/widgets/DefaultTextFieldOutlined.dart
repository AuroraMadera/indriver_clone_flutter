import 'package:flutter/material.dart';

class DefaultTextFieldOutlined extends StatelessWidget {

  String text;
  IconData icon;
  EdgeInsetsGeometry? margin;

  DefaultTextFieldOutlined({
    required this.text, 
    required this.icon,
    this.margin=const EdgeInsets.only(top: 50,left: 20,right: 20),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      margin: margin,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 35, 161, 183),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          label: Text(
            text,
            style: TextStyle(
              color: Colors.white
            )
          ),
          // border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255,35,161,183), 
              width: 2
              )
            ),
            enabledBorder:  OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.blueGrey,
                width: 2 
            )
          ),
          prefixIcon: Container(
          margin: EdgeInsets.only(top: 10),
          child: Wrap(
            alignment: WrapAlignment.spaceEvenly,
            children: [
              Icon(
                icon,
                color: Colors.white,
                ),
              Container(
                height: 20,
                width: 1,
                color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}