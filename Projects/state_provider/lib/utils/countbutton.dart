import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/countmodel.dart';

class countButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Criando countButton");
    final model = Provider.of<CountModel>(context, listen: false);
    return RaisedButton(
      child: Text('Numero'),
      onPressed: () => model.inc(),
    );
  }
}
