import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/colormodel.dart';

//
// Widget para exibir a cor
//
class WidgetD extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Criando WidgetD");
    return Consumer<ColorModel>(
      builder: (context, model, child) {
        print("Recriando ListTile do WidgetD");
        return Container(
          color: model.color,
          child: ListTile(
            title: Text('Cor '),
          ),
        );
      },
    );
  }
}
