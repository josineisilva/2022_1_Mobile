import 'package:flutter/material.dart';
import 'birthdays.dart';
import 'gratitude.dart';
import 'reminders.dart';

//
// classe para a tela principal da aplicacao
//
class Controller extends StatefulWidget {
  @override
  _ControllerState createState() => _ControllerState();
}

//
// Classe para gerenciar o estado da tela principal da aplicacao
//
class _ControllerState extends State<Controller> {

  // Gerenciador do PageView
  PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PageView'),
      ),
      // Objeto para visualizacao das paginas
      body: PageView(
        controller: _controller,
        scrollDirection: Axis.vertical,
        children: [
          Birthdays(),
          Gratitude(),
          Reminders(),
        ],
      ),
    );
  }
}