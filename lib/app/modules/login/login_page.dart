import 'package:flutter/material.dart';
import 'package:sismed/app/components/text_field.dart';
import 'package:sismed/app/components/modal.dart';
import 'package:sismed/app/modules/login/login_store.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final paddingTop = MediaQuery.of(context).padding.top;
    final size = MediaQuery.of(context).size;
    final controll = LoginStore();
    final TextEditingController emailValue = TextEditingController();
    final TextEditingController senhaValue = TextEditingController();
    return Scaffold(
      backgroundColor: Color(0xFF1DE9B6),
      body: Container(
        padding: EdgeInsets.only(top: paddingTop),
        child: Column(
          children: [
            Container(
              height: size.height / 4,
              alignment: Alignment.center,
              child: Text(
                "SisMed",
                style: new TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 60.0,
                    color: Colors.white,
                    fontFamily: "Astigmatic"),
              ),
            ),
            Flexible(
              fit: FlexFit.loose,
              child: Container(
                padding: EdgeInsets.only(top: 80, left: 40, right: 40),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      spreadRadius: 2,
                      blurRadius: 12,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: ListView(
                  children: [
                    TextFieldComponent(
                      labelText: "E-mail",
                      hintText: "Digite seu Email",
                      icon: Icons.email,
                      colorFocus: Colors.black,
                      controller: emailValue,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFieldComponent(
                      labelText: "Senha",
                      hintText: "Digite sua Senha",
                      obscureText: true,
                      icon: Icons.vpn_key,
                      colorFocus: Colors.black,
                      controller: senhaValue,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                        child: Text(
                          "Entrar",
                          style: new TextStyle(
                            fontSize: 17.0,
                            color: Colors.white,
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.greenAccent),
                        ),
                        onPressed: () {
                          controll.login(
                              email: emailValue.text,
                              senha: senhaValue.text,
                              context: context);
                        }),
                    const SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                        onTap: () => {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return ModalRegistro();
                                },
                              )
                            },
                        child: Text('Regitrar', textAlign: TextAlign.center))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
