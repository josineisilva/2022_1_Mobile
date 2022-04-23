import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/colormodel.dart';

//
// Widget para exibir a cor
//
class WidgetB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Criando WidgetB");
    return Consumer<ColorModel>(
      builder: (context, model, child) {
        print("Recriando ListTile do WidgetB");
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
