import 'package:flutter/material.dart';

class WidgetB extends StatelessWidget {
  final int _counter;

  WidgetB(this._counter);

  @override
  Widget build(BuildContext context) {
    print("Recriando WidgetB");
    return Center(
      child: Text(
        '$_counter',
        style: Theme.of(context).textTheme.displayMedium,
      ),
    );
  }
}
