import 'package:flutter/material.dart';

class TextFieldComponent extends StatelessWidget {
  TextFieldComponent(
      {Key key,
      this.labelText,
      this.hintText,
      this.obscureText,
      this.color,
      this.colorFocus,
      this.icon,
      this.validate,
      this.controller});
  final String labelText;
  final String hintText;
  final bool obscureText;
  final Color color;
  final Color colorFocus;
  final IconData icon;
  final Function validate;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      height: size.height * .06,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(50),
      ),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        controller: controller,
        obscureText: obscureText == null ? false : obscureText,
        cursorColor: colorFocus,
        decoration: InputDecoration(
          suffixIcon: Icon(icon),
          labelText: labelText,
          hintText: hintText,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: colorFocus),
          ),
          focusColor: Colors.red,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        onChanged: validate,
      ),
    );
  }
}
