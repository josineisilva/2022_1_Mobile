import 'package:flutter/material.dart';

//
// Widget sem acesso ao InheritedWidget
//
class WidgetC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Recriando WidgetC");
    return Text('I am Widget C');
  }
}