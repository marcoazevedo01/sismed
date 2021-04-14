import 'package:mobx/mobx.dart';
import 'package:sismed/app/modules/http_service.dart';
import 'package:flutter/material.dart';

part 'details_store.g.dart';

class DetailsStore = DetailsStoreBase with _$DetailsStore;

abstract class DetailsStoreBase with Store {
  var dados = {};

  cadastrar({id, context}) async {
    var insert = {'_id': id};
    await HttpService.post_Obj(insert, '/newUser');

    Navigator.of(context).pop();
  }

  
}
