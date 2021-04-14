import 'package:flutter_modular/flutter_modular.dart';
import 'package:sismed/app/modules/home/client/medic.dart';

import 'load_page.dart';
import 'modules/login/login_page.dart';
import 'modules/home/home_page.dart';
import 'modules/home/clinics/details.dart';
import 'modules/home/clinics/details_store.dart';
class AppModule extends Module {
  @override
  final List<Bind> binds = [Bind((i) => DetailsStore())];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: LoadModule()),
    ChildRoute('/login', child: (_, args) => LoginPage()),
    ChildRoute('/home', child: (_, args) => HomePage()),
    ChildRoute('/details', child: (_, args) => Details()),
    ChildRoute('/medic', child: (_, args) => Medic()),
  ];

}