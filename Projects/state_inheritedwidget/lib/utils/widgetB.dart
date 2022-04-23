import 'package:flutter/material.dart';
import 'controlwidget.dart';

//
// Widget para exibir a quantidade de itens
//
class WidgetB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Recriando WidgetB");
    // Acesso ao estado do InheritedWidget
    // Registra o widget na lista a recriar
    // quando o InheritedWidget e alterado
    final ControlWidgetState state = ControlWidget.of(context);

    return Text('${state.itemsCount}');
  }
}
