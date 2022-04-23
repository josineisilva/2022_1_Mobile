import 'package:flutter/material.dart';
import '../blocs/bloc.dart';

class colorButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MyBLoC bloc = MyBLoC();
    print("Criando colorButton");
    return RaisedButton(
      child: Text('Cor'),
      onPressed: () => bloc.newColor(),
    );
  }
}
