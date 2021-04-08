import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(15),
      child: ListView.separated(
        itemCount: 1,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Modular.to.pushNamed('/pending'),
            child: Container(
              height: size.height / 7.5,
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
