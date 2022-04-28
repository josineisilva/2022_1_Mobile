import 'package:flutter/material.dart';

//
// Classe para a tela de lembretes
//
class Reminders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Icon(
        Icons.access_alarm,
        size: 120.0,
        color: Colors.purple,
      ),
    );
  }
}