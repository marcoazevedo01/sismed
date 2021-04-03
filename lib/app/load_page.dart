import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoadPage extends StatefulWidget {
  @override
  _LoadPageState createState() => _LoadPageState();

}

class _LoadPageState extends State<LoadPage> {
  @override
  initState() {super.initState();
    Future.delayed(Duration(seconds: 4)).then((_){
    Navigator.pushNamed(context, "/login");
  });}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
      body: Center(child: Image.asset("assets/logo.webp"))
    );
  }

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => LoadPage()),
  ];
}
