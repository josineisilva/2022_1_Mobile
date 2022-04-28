import 'package:flutter/material.dart';
import 'gratitude.dart';
import 'reminders.dart';
import 'birthdays.dart';

//
// Classe para a tela principal da aplicacao
//
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

//
// Classe para gerenciar o estado da tela principal da aplicacao
//
class _HomeState extends State<Home> {
  // Indice da pagina selecionada
  int _currentIndex = 0;
  // Lista de paginas a exibir
  List _listPages = List.empty(growable: true);
  // Widget com a pagina selecionada
  Widget? _currentPage;

  //
  // Cria a lista de widgets para as demais paginas
  //
  @override
  void initState() {
    super.initState();

    _listPages
      ..add(Birthdays())
      ..add(Gratitude())
      ..add(Reminders());
    _currentPage = Birthdays();
  }

  //
  // Altera o estado trocando qual a pagina a ser exibida
  //
  void _changePage(int selectedIndex) {
    setState(() {
      _currentIndex = selectedIndex;
      _currentPage = _listPages[selectedIndex];
    });
  }

  //
  // Constroi o widget da pagina principal
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BottomNavigationBar'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: _currentPage,
        ),
      ),
      //
      // Seleciona a pagina a exibir
      //
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.cake),
            label: 'Birthdays',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sentiment_satisfied),
            label: 'Gratitude',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_alarm),
            label: 'Reminders',
          ),
        ],
        onTap: (selectedIndex) => _changePage(selectedIndex),
      ),
    );
  }
}
