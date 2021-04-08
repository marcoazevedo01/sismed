import 'package:flutter/material.dart';

class TextGlobal extends StatelessWidget {
  TextGlobal({
    this.text,
    this.size,
    this.fontWeight,
    this.fontColor,
    this.align,
  });
  final String text;
  final double size;
  final FontWeight fontWeight;
  final Color fontColor;
  final TextAlign align;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style: TextStyle(
        fontSize: size,
        fontWeight: fontWeight,
        color: fontColor == null ? Color(0xFF616060) : fontColor,
      ),
    );
  }
}
