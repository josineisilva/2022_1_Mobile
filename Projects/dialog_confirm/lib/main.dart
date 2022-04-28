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
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _confirmado = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dialog"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () async {
                _confirmado = (await _show(context))!;
                setState(() {});
              },
              child: const Text("Show Dialog"),
            ),
            Divider(),
            Text(_confirmado?
              'Confirmado':'Nao confirmado',
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ],
        ),
      ),
    );
  }
}

Future<bool?> _show(BuildContext context) async {
  return await showDialog<bool>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Confirmacao'),
        content: const Text('Confirma acao?'),
        actions: <Widget>[
          FlatButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text("OK")
          ),
          FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text("CANCEL"),
          ),
        ],
      );
    },
  );
}
