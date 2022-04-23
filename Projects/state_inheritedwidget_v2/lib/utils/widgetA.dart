import 'package:flutter/material.dart';
import 'controlwidget.dart';

//
// Widget para adicionar novo item
//
class WidgetA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Recriando WidgetA");
    // Acesso ao estado do ControlWidget
    final ControlWidgetState state = ControlWidget.of(context, false);

    return Container(
      child: RaisedButton(
        child: Text('Add Item'),
        onPressed: () => state.addItem('new item'),
      ),
    );
  }
}
