import 'package:flutter_modular/flutter_modular.dart';
import 'package:sismed/app/controller/details.dart';
import 'package:sismed/app/views/Admin/details.dart';
import 'package:sismed/app/views/Client/clinic.dart';
import 'package:sismed/app/views/Client/medic.dart';
import 'package:sismed/app/views/home_page.dart';
import 'package:sismed/app/views/load_page.dart';
import 'package:sismed/app/views/login_page.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [Bind((i) => DetailsStore())];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: LoadModule()),
    ChildRoute('/login', child: (_, args) => LoginPage()),
    ChildRoute('/home', child: (_, args) => HomePage()),
    ChildRoute('/details', child: (_, args) => Details()),
    //client
    ChildRoute('/medic', child: (_, args) => Medic()),
    ChildRoute('/clinic', child: (_, args) => Clinic()),
  ];

}