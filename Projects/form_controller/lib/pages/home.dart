import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Controlador para o TextField 1
  final text1Controller = TextEditingController();
  // Controlador para o TextField 2
  final text2Controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    text2Controller.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    text1Controller.dispose();
    text2Controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Controller'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: text1Controller,
              onChanged: (text) => print("First text field: $text"),
            ),
            TextField(
              controller: text2Controller,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _copy(),
        tooltip: 'Copy!',
        child: Icon(Icons.content_copy),
      ),
    );
  }

  //
  // Exibie o valor atual do TextField
  //
  _printLatestValue() {
    print("Second text field: ${text2Controller.text}");
  }

  //
  // Copiar o TextField 1 para o TextField 2
  //
  _copy() {
    text2Controller.text = text1Controller.text;
  }
}
