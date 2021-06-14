import 'package:mobx/mobx.dart';
import 'dart:convert';

import 'package:sismed/config/http_service.dart';

mixin _$ModalStore on ModalStoreBase, Store {}
class ModalStore = ModalStoreBase with _$ModalStore;

abstract class ModalStoreBase with Store {
  cadastrar({name, date, type, clinic, context}) async {
    if (name != '' && date != '' && type != '' && clinic != '') {
      Map data = {
        'name': name,
        'date': date.toString(),
        'type': type,
        'clinica': clinic,
        'status': 'consulta'
      };
      var obj = jsonEncode(data);
      var response = await HttpService.post_Obj(obj, '/consultation');
      print(response);
    } else {
      //messagem('Preencha os campos', context, Colors.amber);
    }
  }
}
