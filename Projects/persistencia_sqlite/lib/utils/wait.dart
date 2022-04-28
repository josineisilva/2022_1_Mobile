import 'package:flutter/material.dart';

//
// Apresenta um indicador de espera por uma operacao
//
class WaitWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
        color: Colors.white.withOpacity(0.8));
  }
}
