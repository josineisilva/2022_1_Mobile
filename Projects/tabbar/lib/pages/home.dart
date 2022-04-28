import 'package:flutter/material.dart';
import 'birthdays.dart';
import 'gratitude.dart';
import 'reminders.dart';

//
// Classe para as opcoes de navegacao
//
class Choice {
  final String title;
  final IconData icon;
  final Widget widget;

  Choice(this.title, this.icon, this.widget);
}

//
// Lista de opcoes de navegacao
//
List<Choice> choices = <Choice>[
  Choice('Birthdays', Icons.cake, Birthdays()),
  Choice('Gratitude', Icons.sentiment_satisfied, Gratitude()),
  Choice('Reminders', Icons.access_alarm, Reminders()),
];

//
// Classe com a tela principal da aplicacao
//
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: choices.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TabBar'),
          // Criando a barra de navegacao
          bottom: TabBar(
            isScrollable: true,
            tabs: choices.map((Choice choice) {
              return Tab(
                text: choice.title,
                icon: Icon(choice.icon),
              );
            }).toList(),
          ),
        ),
        // Selecionando a pagina a exibir
        body: TabBarView(
          children: choices.map((Choice choice) {
            return choice.widget;
          }).toList(),
        ),
      ),
    );
  }
}
