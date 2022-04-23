import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/countmodel.dart';

//
// Widget para exibir contador
//
class WidgetA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Criando WidgetA");
    return Consumer<CountModel>(
       builder: (context, model, child) {
         print("Recriando texto do WidgetA");
         return ListTile(
           title: Text('Contador ${model.count}'),
         );
       },
     );
  }
}
