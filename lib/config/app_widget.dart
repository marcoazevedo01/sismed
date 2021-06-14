import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SisMed',
      theme: ThemeData(
          primarySwatch: MaterialColor(0xFF1DE9B6, {
        50: Color(0xFFea5154),
        100: Color(0xFFea5154),
        200: Color(0xFFea5154),
        300: Color(0xFFea5154),
        400: Color(0xFFea5154),
        500: Color(0xFFea5154),
        600: Color(0xFFea5154),
        700: Color(0xFFea5154),
        800: Color(0xFFea5154),
        900: Color(0xFFea5154),
      })),
    ).modular();
  }
}
