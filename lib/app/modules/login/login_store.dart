import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sismed/app/modules/http_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

mixin _$LoginStore on LoginStoreBase, Store {}
class LoginStore = LoginStoreBase with _$LoginStore;

abstract class LoginStoreBase with Store {
  login({email, senha, context}) async {
    if (email != '' && senha != '') {
      var response = await HttpService.post_service(email, senha, '/login');
      if (response['token'] != null) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', response['token']);
        Modular.to.pushNamed("/home");
      } else {
        messagem(response['info'], context, Color(0xFFea5154));
      }
    } else {
      messagem('Preencha os campos', context, Colors.amber);
    }
  }

  cadastrar({email, senha, context}) async {
    if (email != '' && senha != '') {
      var response = await HttpService.post_service(email, senha, '/newUser');
      if (response['info'] != '') {
        messagem(response['info'], context, Colors.green);
        Navigator.of(context).pop();
      } else {
        messagem(response['erro'], context, Colors.red);
      }
    } else {
      messagem('Preencha os campos', context, Colors.amber);
    }
  }

  messagem(msg, context, color) {
    final snackBar = SnackBar(
      content: Text(msg),
      backgroundColor: color,
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0, // Inner padding for SnackBar content.
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      action: SnackBarAction(
        label: '',
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    );
    return ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
