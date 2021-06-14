import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sismed/app/controller/details.dart';
import 'package:sismed/app/views/components/text_field.dart';
import 'package:sismed/app/views/components/text_global.dart';
import 'package:sismed/config/http_service.dart';

class Medic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final Details = Modular.get<DetailsStore>();
    return Padding(
      padding: EdgeInsets.all(15),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: LayoutBuilder(
          builder: (_, constraints) {
            Future chambers = HttpService.get_service('/consultation');
            return Container(
              padding: EdgeInsets.all(1),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    height: MediaQuery.of(context).size.height / 15,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: EdgeInsets.only(bottom: 14),
                    child: TextField(
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.search, color: Colors.black),
                        border: InputBorder.none,
                      ),
                      cursorColor: Colors.black,
                    ),
                  ),
                  FutureBuilder(
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
                        return Container(
                          height: MediaQuery.of(context).size.height/1.8,
                          child: Center(                           
                            child: CircularProgressIndicator(),
                          ),
                        );
                      } else {
                        List chambersData = snapshot.data;
                        return Expanded(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: ListView.separated(
                              itemCount: chambersData.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Details.dados = chambersData[index];
                                    Modular.to.pushNamed('/details');
                                  },
                                  child: Container(
                                    height: size.height / 5.5,
                                    child: Card(
                                      child: Padding(
                                        padding: EdgeInsets.all(15),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                TextGlobal(
                                                  text: chambersData[index]['name'],
                                                  size: 15,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                TextGlobal(
                                                  text: 'Data ' +
                                                  chambersData[index]['date'],
                                                  size: 13,
                                                ),
                                                Expanded(child: Container()),
                                                FaIcon(
                                                  FontAwesomeIcons.star,
                                                  color: Color(0xFF616060),
                                                  size: 18,
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            TextGlobal(
                                              text: "Tipo: " +
                                              chambersData[index]['type'],
                                              size: 13,
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                TextGlobal(
                                                  text: "Clinica: " +
                                                  chambersData[index]['clinica'],
                                                  size: 13,
                                                ),
                                                Expanded(child: Container()),
                                                TextGlobal(
                                                  text: chambersData[index]['type'],
                                                  size: 13,
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      const Divider(),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
