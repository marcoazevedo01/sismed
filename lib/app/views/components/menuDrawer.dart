import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Drawer(
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
            Text(
              'By M&V softwares',
              textAlign: TextAlign.center,
              style: new TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 15.0,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      );
  }
}
