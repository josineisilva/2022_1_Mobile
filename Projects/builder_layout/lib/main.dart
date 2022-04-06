import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {

  @override
  Widget build (BuildContext ctxt) {
    print("Criando Home");
    return Scaffold(
      appBar: AppBar(
        title: Text("LayoutBuilder"),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            print("Recriando LayoutBuilder ${constraints.maxWidth}");
            return constraints.maxWidth > 600
              ? _twoContainers()
              : _oneContainer();
          },
        ),
      ),
    );
  }

  Widget _oneContainer() {
    return Center(
      child: Container(
        height: 300.0,
        width: 300.0,
        color: Colors.red,
      ),
    );
  }

  Widget _twoContainers() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            height: 300.0,
            width: 300.0,
            color: Colors.red,
          ),
          Container(
            height: 300.0,
            width: 300.0,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
