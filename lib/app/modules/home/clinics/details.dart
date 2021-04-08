import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sismed/app/components/text_global.dart';

class Details extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
          width: size.width,
          padding: EdgeInsets.all(30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextGlobal(
                  text: 'Marco antonio',
                  fontWeight: FontWeight.bold,
                  size: 20,
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.phoneAlt,
                      size: 15,
                      color: Color(0xFF616060),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    TextGlobal(
                      text: '(17) 99782-6312',
                      size: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                TextGlobal(
                  text: 'Endereço',
                  fontWeight: FontWeight.bold,
                  size: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: size.width / 7,
                    right: size.width / 7,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextGlobal(
                            text: "Jales",
                            size: 15,
                            fontWeight: FontWeight.bold,
                          ),
                          Expanded(child: Container()),
                          FaIcon(
                            FontAwesomeIcons.city,
                            size: 15,
                            color: Color(0xFF616060),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextGlobal(
                            text: "TAl, 11",
                            size: 15,
                            fontWeight: FontWeight.bold,
                          ),
                          Expanded(child: Container()),
                          FaIcon(
                            FontAwesomeIcons.road,
                            size: 15,
                            color: Color(0xFF616060),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextGlobal(
                            text: "Casa",
                            size: 15,
                            fontWeight: FontWeight.bold,
                          ),
                          Expanded(child: Container()),
                          FaIcon(
                            FontAwesomeIcons.mapMarkerAlt,
                            size: 15,
                            color: Color(0xFF616060),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextGlobal(
                  text: 'Detalhes',
                  fontWeight: FontWeight.bold,
                  size: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: size.height / 3,
                  width: double.infinity,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(height: 7),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          AutoSizeText.rich(
                            TextSpan(
                                text: 'Exame- a'),
                            maxLines: 2,
                          ),
                          Expanded(child: Divider()),
                          TextGlobal(text: '2')
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              Container(
                height: size.height / 3,

                width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center ,
                    crossAxisAlignment: CrossAxisAlignment.center ,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          Modular.to.pushNamed("/home");
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.redAccent)
                        ),

                        icon: Icon(Icons.arrow_back, size: 18),
                        label: Text("Voltar",
                          style: new TextStyle(
                          fontSize: 17.0,
                          color: Colors.white,
                          ),
                        ),
                      ),
                      Spacer(),
                      ElevatedButton.icon(
                           onPressed: () {
                              // Respond to button press
                           },
                        style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.lightGreen)
                        ),
                        icon: Icon(Icons.check, size: 18),
                        label: Text("Concluir",
                          style: new TextStyle(
                          fontSize: 17.0,
                          color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  )
                ),
              ],
            ),
          ),
        ));
  }
}
