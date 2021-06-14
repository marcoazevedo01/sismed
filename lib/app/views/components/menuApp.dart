import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MenuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'SisMed',
        style: new TextStyle(
            fontSize: 35.0, color: Colors.black54, fontFamily: "Astigmatic"),
      ),
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () => Modular.to.pop(),
      ),
      centerTitle: true,
    );
  }
}
