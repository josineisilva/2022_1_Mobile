import 'package:flutter/material.dart';
import '../utils/widgetB.dart';

class WidgetA extends StatelessWidget {
  final int _counter;

  WidgetA(this._counter);

  @override
  Widget build(BuildContext context) {
    print("Recriando WidgetA");
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'You have pushed the button this many times:',
          ),
          WidgetB(_counter),
        ],
      ),
    );
  }
}
