import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/countmodel.dart';

//
// Widget para exibir contador
//
class WidgetC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Criando WidgetC");
    return Consumer<CountModel>(
       builder: (context, model, child) {
         print("Recriando texto do WidgetC");
         return ListTile(
           title: Text('Contador ${model.count}'),
         );
       },
     );
  }
}
