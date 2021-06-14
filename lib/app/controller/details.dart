import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
import 'package:sismed/config/http_service.dart';

part 'details.g.dart';

class DetailsStore = DetailsStoreBase with _$DetailsStore;

abstract class DetailsStoreBase with Store {
  var dados = {};

  cadastrar({id, context}) async {
    var insert = {'_id': id};
    await HttpService.post_Obj(insert, '/newUser');

    Navigator.of(context).pop();
  }

  
}
