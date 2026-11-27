import 'package:flutter/material.dart';

class DefaultTextFieldOutlined extends StatelessWidget {

  final String text;
  final Function(String text)? onChanged;
  final IconData icon;
  final EdgeInsetsGeometry? margin;
  final String? Function(String?)? validator;

  const DefaultTextFieldOutlined({
    super.key,
    required this.text,
    required this.icon,
    this.margin = const EdgeInsets.only(top: 50, left: 20, right: 20),
    this.validator,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      margin: margin,
      decoration: const BoxDecoration(
        color: Color.fromARGB(70, 20, 90, 180),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5),
          topRight: Radius.circular(5),
        ),
      ),
      child: TextFormField(
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
        cursorColor: Colors.white,
        onChanged: (text) {
          onChanged?.call(text);
        },
        validator: validator,
        decoration: InputDecoration(
          label: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          floatingLabelStyle: const TextStyle(
            color: Colors.white,
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 65, 150, 245),
              width: 2,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 65, 130, 220),
              width: 1.5,
            ),
          ),
          prefixIcon: Container(
            margin: const EdgeInsets.only(top: 10),
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
