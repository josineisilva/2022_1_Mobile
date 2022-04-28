import 'package:flutter/material.dart';

//
// Classe para a tela principal da aplicacao
//
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigator Named'),
      ),
      body: Column(children: <Widget>[
        Card(
          child: ListTile(
            leading: Icon(
              Icons.cake,
              size: 52.0,
              color: Colors.orange,
            ),
            title: Text("Birthdays"),
            onTap: () {
              Navigator.pushNamed(context, '/birthdays');
            },
          ),
        ),
        Divider(),
        Card(
          child: ListTile(
            leading: Icon(
              Icons.sentiment_satisfied,
              size: 52.0,
              color: Colors.lightGreen,
            ),
            title: Text("Gratitude"),
            onTap: () {
              Navigator.pushNamed(context, '/gratitude');
            },
          ),
        ),
        Divider(),
        Card(
          child: ListTile(
            leading: Icon(
              Icons.access_alarm,
              size: 52.0,
              color: Colors.purple,
            ),
            title: Text("Reminders"),
            onTap: () {
              Navigator.pushNamed(context, '/reminders');
            },
          ),
        ),
      ]),
    );
  }
}