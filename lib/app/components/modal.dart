import 'package:flutter/material.dart';
import 'package:sismed/app/components/text_field.dart';
import 'package:sismed/app/components/modal_store.dart';
import 'package:sismed/app/modules/login/login_store.dart';
import 'package:date_field/date_field.dart';

class ModalRegistro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailValue = TextEditingController();
    final TextEditingController senhaValue = TextEditingController();
    final controll = LoginStore();
    return AlertDialog(
      title: new Text("Novo Registro"),
      content: Container(
        height: 180,
        child: Column(
          children: [
            new TextFieldComponent(
              labelText: "E-mail",
              colorFocus: Color(0xFFea5154),
              controller: emailValue,
            ),
            const SizedBox(
              height: 20,
            ),
            new TextFieldComponent(
              labelText: "Senha",
              obscureText: true,
              colorFocus:  Color(0xFFea5154),
              controller: senhaValue,
            ),
            const SizedBox(
              height: 20,
            ),
            new TextFieldComponent(
              labelText: "Telefone",

              colorFocus:  Color(0xFFea5154),

            )
          ],
        ),
      ),
      actions: <Widget>[
        // define os botões na base do dialogo
        new FlatButton(
          child: new Text("Fechar"),
          textColor: Colors.red,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        new FlatButton(
          child: new Text("Salvar"),
          textColor: Colors.green,
          onPressed: () {
            controll.cadastrar(email: emailValue.text,senha: senhaValue.text, context: context);
          },
        ),
      ],
    );
  }
}

class ModalConsulta extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController nameValue = TextEditingController();
    var dateValue;
    final TextEditingController typeValue = TextEditingController();
    final TextEditingController clinicValue = TextEditingController();
    final TextEditingController statusValue = TextEditingController();

    final controll = ModalStore();
    return AlertDialog(
      title: new Text("Nova consulta"),
      content: Container(
        height: 280,
        child: Column(
          children: [
            new TextFieldComponent(
              labelText: "Nome",
              colorFocus: Color(0xFFea5154),
              controller: nameValue,
            ),
            const SizedBox(
              height: 20,
            ),
            DateTimeFormField(
              decoration: const InputDecoration(
                hintStyle: TextStyle(color: Colors.black45),
                errorStyle: TextStyle(color: Colors.redAccent),
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.event_note),
                labelText: 'Hora',
              ),
              mode: DateTimeFieldPickerMode.time,
              autovalidateMode: AutovalidateMode.always,
              validator: (e) => (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
              onDateSelected: (DateTime value) {
                  dateValue = value;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            new TextFieldComponent(
              labelText: "Tipo",
              colorFocus:  Color(0xFFea5154),
              controller: typeValue,
            ),
            const SizedBox(
              height: 20,
            ),
            new TextFieldComponent(
              labelText: "Clinica",
              colorFocus:  Color(0xFFea5154),
              controller: clinicValue,
            )
          ],
        ),
      ),
      actions: <Widget>[
        // define os botões na base do dialogo
        new FlatButton(
          child: new Text("Fechar"),
          textColor: Colors.red,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        new FlatButton(
          child: new Text("Salvar"),
          textColor: Colors.green,
          onPressed: () {
            controll.cadastrar(name: nameValue.text, date: dateValue, type: typeValue.text, clinic: clinicValue.text, context: context);
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}