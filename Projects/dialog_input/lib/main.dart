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
  String _input = "";

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
                String? _retorno = await _show(context);
                if ( _retorno != null ) {
                  _input = _retorno;
                  setState(() {});
                }
              },
              child: const Text("Show Dialog"),
            ),
            Divider(),
            Text(_input,
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ],
        ),
      ),
    );
  }
}

Future<String?> _show(BuildContext context) async {
  String? _entrada;
  return await showDialog<String>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Entre com um texto'),
        content: Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                autofocus: true,
                decoration: InputDecoration(
                  labelText: 'Entrada',
                ),
                onChanged: (value) => _entrada = value,
              )
            )
          ],
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop(_entrada);
            },
          ),
        ],
      );
    },
  );
}
