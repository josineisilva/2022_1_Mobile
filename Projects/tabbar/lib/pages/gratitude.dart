import 'package:flutter/material.dart';

//
// Classe para a tela de agradecimentos
//
class Gratitude extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Icon(
        Icons.sentiment_satisfied,
        size: 120.0,
        color: Colors.lightGreen,
      ),
    );
  }
}