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

enum dialogAction { RESET, SAVE, CANCEL }

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _action = dialogAction.RESET;
  String _actionText = 'Cancel';

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
                _action = (await _show(context))!;
                if (_action == dialogAction.RESET)
                  _actionText = 'Reset';
                else if (_action == dialogAction.SAVE)
                  _actionText = 'Save';
                else if (_action == dialogAction.CANCEL)
                  _actionText = 'Cancel';
                setState(() {});
              },
              child: const Text("Show Dialog"),
            ),
            Divider(),
            Text(_actionText,
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ],
        ),
      ),
    );
  }
}

Future<dialogAction?> _show(BuildContext context) async {
  return await showDialog<dialogAction>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return SimpleDialog(
        title: const Text('Selecione a acao'),
        children: <Widget>[
          SimpleDialogOption(
            onPressed: () => Navigator.pop(context, dialogAction.RESET),
            child: const Text('Resetar os dados'),
          ),
          SimpleDialogOption(
            onPressed: () => Navigator.pop(context, dialogAction.SAVE),
            child: const Text('Salvar os dados'),
          ),
          SimpleDialogOption(
            onPressed: () => Navigator.pop(context, dialogAction.CANCEL),
            child: const Text('Cancelar'),
          ),
        ],
      );
    },
  );
}
