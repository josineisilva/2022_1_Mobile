import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/countmodel.dart';
import '../models/colormodel.dart';
import '../utils/countbutton.dart';
import '../utils/colorbutton.dart';
import '../utils/widgetA.dart';
import '../utils/widgetB.dart';
import '../utils/widgetC.dart';
import '../utils/widgetD.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Criando Home");
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider<CountModel>(create: (context) => CountModel()),
        ChangeNotifierProvider<ColorModel>(create: (context) => ColorModel()),
      ],
      child: Scaffold(
        appBar: AppBar(title: Text('Provider')),
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
      ),
    );
  }
}
