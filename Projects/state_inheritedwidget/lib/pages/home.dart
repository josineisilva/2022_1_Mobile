import 'package:flutter/material.dart';
import '../utils/controlwidget.dart';
import '../utils/widgetA.dart';
import '../utils/widgetB.dart';
import '../utils/widgetC.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Criando Home");
    // Cria a subarvoce a partir do InheritedWidget
    return ControlWidget(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Inherited Widget'),
        ),
        body: Column(
          children: <Widget>[
            WidgetA(),
            Container(
              child: Row(
                children: <Widget>[
                  Icon(Icons.shopping_cart),
                  WidgetB(),
                ],
              ),
            ),
            WidgetC(),
          ],
        ),
      ),
    );
  }
}