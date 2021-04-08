import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class Conclued extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(15),
      child: ListView.separated(
        itemCount: 2,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (context, index) {
          return GestureDetector(
            child: Container(
              height: size.height / 4.5,
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(15),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
