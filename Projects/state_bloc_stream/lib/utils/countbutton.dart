import 'package:flutter/material.dart';
import '../blocs/bloc.dart';

class countButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MyBLoC bloc = MyBLoC();
    print("Criando countButton");
    return RaisedButton(
      child: Text('Numero'),
      onPressed: () => bloc.inc(),
    );
  }
}