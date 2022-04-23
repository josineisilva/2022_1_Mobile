import 'package:flutter/material.dart';
import 'controlwidget.dart';

//
// Widget para exibir contador
//
class WidgetA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Recriando WidgetA");
    // Acesso ao InheritedModel
    final MyInheritedModel? model =
      MyInheritedModel.of(context, aspect: ASPECTS.NUMBER);
    return ListTile(
      title: Text('Contador ${model?.count}'),
    );
  }
}
