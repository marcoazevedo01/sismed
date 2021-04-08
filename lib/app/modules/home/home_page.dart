import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sismed/app/modules/home/clinics/conclued.dart';
import 'package:sismed/app/modules/home/clinics/pending.dart';
import 'package:sismed/app/modules/menu/menu.dart';
import 'package:sismed/app/components/modal.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('SisMed',
            style: new TextStyle(

              fontSize: 35.0,
              color: Colors.black54,
                fontFamily: "Astigmatic"
            ),
          ),
          leading: Builder(
            builder: (BuildContext context){
              return IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () => Modular.to.pushNamed("/login")
              );
            },
          ),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(
                icon: FaIcon(FontAwesomeIcons.bookMedical),
                text: 'Consultas',
              ),
              Tab(
                icon: FaIcon(FontAwesomeIcons.calendarCheck),
                text: 'Concluidas',
              ),
              Tab(
                icon: FaIcon(FontAwesomeIcons.handHoldingMedical),
                text: 'Clinica',
              ),
            ],
          ),
        ),
        endDrawer: Drawer(
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Menu',
                  style: textTheme.headline6,
                ),
              ),
              Divider(
                height: 1,
                thickness: 1,
              ),
              ListTile(
                leading: Icon(Icons.access_alarms_rounded),
                title: Text('Horarios'),

              ),
              ListTile(
                leading: Icon(Icons.payments_outlined),
                title: Text('Pagamentos'),

              ),
              ListTile(
                leading: Icon(Icons.addchart_sharp),
                title: Text('Comissao'),

              ),
              Divider(
                height: 1,
                thickness: 1,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Sobre',
                ),
              ),
              ListTile(
                leading: Icon(Icons.info),
                title: Text('Ajuda'),

              ),
              const SizedBox(
                height: 360,
              ),
              Text('By M&V softwares',
                textAlign: TextAlign.center,
                style: new TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15.0,
                    color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Pending(),
            Conclued(),
            Menu(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xff03dac6),
          foregroundColor: Colors.black,
          mini: true,
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
               return ModalConsulta();
              },
            );
            // Respond to button press
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}