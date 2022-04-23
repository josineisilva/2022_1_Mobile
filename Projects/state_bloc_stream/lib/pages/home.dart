import 'package:flutter/material.dart';
import '../blocs/bloc.dart';
import '../utils/countbutton.dart';
import '../utils/colorbutton.dart';
import '../utils/widgetA.dart';
import '../utils/widgetB.dart';
import '../utils/widgetC.dart';
import '../utils/widgetD.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State {
  MyBLoC bloc = MyBLoC();

  @override
  Widget build(BuildContext context) {
    print("Criando Home");
    return Scaffold(
      appBar: AppBar(title: Text('BLoC')),
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
          countButton(),
          colorButton(),
        ],
      ),
    );
  }

  @override
  dispose() {
    bloc.dispose();
  }
}
