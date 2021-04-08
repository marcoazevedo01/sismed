import 'package:flutter_modular/flutter_modular.dart';

import 'load_page.dart';
import 'modules/login/login_page.dart';
import 'modules/home/home_page.dart';
import 'modules/menu/menu_page.dart';
import 'modules/home/clinics/details.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: LoadModule()),
    ChildRoute('/login', child: (_, args) => LoginPage()),
    ChildRoute('/home', child: (_, args) => HomePage()),
    ChildRoute('/details', child: (_, args) => Details()),
  ];

}