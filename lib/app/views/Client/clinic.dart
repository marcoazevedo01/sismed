import 'package:flutter/material.dart';

class Clinic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Center(
          child: GestureDetector(
            //onTap: () => Navigator.pushNamed(context, '/product'),
            child: Container(
              height: size.height / 3,
              width: size.width / 1.1,
              decoration: BoxDecoration(
                color: Color(0xFFa965d6),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topRight,
                    child: Container(
                      height: size.height / 10,
                      width: size.width / 6,
                      child: Icon(
                        Icons.add,
                        color: Color(0xFF404040),
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFFca89f5),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          bottomLeft: Radius.circular(15),
                        ),
                      ),
                    ),
                  ),
            
                  Container(
                    padding: EdgeInsets.only(top: 0, left: 20, right: 20),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "UVA",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Container(
                          width: size.width / 2,
                          child: Text(
                            "UVA THOMPSON SEM SEMENTE",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Color(0xFF2f0045),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Text(
                              "R\$10.00",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            Expanded(child: Container()),
                            Text(
                              "Visualizar",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Color(0xFF2f0045),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "POR KG",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Color(0xFF2f0045),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
