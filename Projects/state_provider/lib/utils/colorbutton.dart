import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/colormodel.dart';

class colorButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Criando colorButton");
    final model = Provider.of<ColorModel>(context);
    return RaisedButton(
      child: Text('Cor'),
      onPressed: () => model.newColor(),
    );
  }
}
