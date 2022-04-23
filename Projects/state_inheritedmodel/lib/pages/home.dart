import 'package:flutter/material.dart';
import '../utils/controlwidget.dart';
import '../utils/widgetA.dart';
import '../utils/widgetB.dart';
import '../utils/widgetC.dart';
import '../utils/widgetD.dart';

final GlobalKey<ControlWidgetState> _key = GlobalKey<ControlWidgetState>();

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Criando Home");
    return ControlWidget(
      key: _key,
      child: Scaffold(
        appBar: AppBar(title: Text('Inherited Model')),
        body: Column(
          children: <Widget>[
            WidgetA(),
            WidgetB(),
            WidgetC(),
            WidgetD(),
          ],
        ),
        bottomNavigationBar: ButtonBar(
          alignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RaisedButton(
              onPressed: () => _key.currentState?.inc(),
              child: Text('Numero')
            ),
            RaisedButton(
              onPressed: () => _key.currentState?.newColor(),
              child: Text('Cor')
            ),
          ],
        ),
      ),
    );
  }
}
