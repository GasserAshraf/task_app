import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hint;
  final IconData icon;
  final Function onClick;

  CustomTextFormField(
      {@required this.onClick, @required this.hint, @required this.icon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        validator: (value) {
          if (value.isEmpty) {
            return "Error in this field";
          }
        },
        onSaved: onClick,

        // textAlign: TextAlign.right,
        // textDirection: TextDirection.rtl,
        decoration: new InputDecoration(
          prefixIcon: Icon(icon, color: Color(0xFF007AE7)),
         // suffixIcon: ,
          hintText: hint,
          hintStyle: TextStyle(color: Color(0xFF707070)),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF007AE7)),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF007AE7)),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF007AE7)),
          ),
        ));
  }
}
