import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sismed/app/components/text_field.dart';
import 'package:sismed/app/components/text_global.dart';
import 'package:sismed/app/modules/http_service.dart';

class Pending extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.all(15),
      child: Scaffold(


      body: LayoutBuilder(
        builder: (_, constraints) {
          Future chambers = HttpService.get_service('/consultation');
          return Container(


            padding: EdgeInsets.all(12),
            child: FutureBuilder(
              future: chambers,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: TextFieldComponent(
                      labelText: "Erro ao acessar Banco de Dados",
                    ),
                  );
                }
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  List chambersData = snapshot.data;
                  return ListView.separated(
                    itemCount: chambersData.length,

                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {

                          //HttpService.get_service('/details');
                          Modular.to.pushNamed('/details');
                        },
                        child: Container(
                            height: size.height / 5.5,
                            child: Card(
                            child: Padding(
                            padding: EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextGlobal(
                                    text: chambersData[index]['name'],
                                    size: 15,
                                    fontWeight: FontWeight.bold),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                TextGlobal(
                                    text: 'Data '+chambersData[index]['date'], size: 13),
                                Expanded(child: Container()),
                                FaIcon(
                                  FontAwesomeIcons.clock,
                                  color: Color(0xFF616060),
                                  size: 18,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextGlobal(text: "Tipo: "+chambersData[index]['type'], size: 13),
                            const SizedBox(
                              height: 5,
                            ),
                            TextGlobal(text: "Clinica: "+chambersData[index]['clinica'], size: 13),

                          ],

                        ),

                      ),
                      ),
                      ),
                      );


                    },
                    separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
                  );
                }
              },
            ),
          );
        },
      ),
    ),
    );
  }
}
