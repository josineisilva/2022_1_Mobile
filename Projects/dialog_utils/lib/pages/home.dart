import 'package:flutter/material.dart';
import '../utils/confirm.dart';
import '../utils/showalert.dart';
import '../utils/showerror.dart';

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
                showAlert(context,
                    "Informacoes para o usuario"
                );
              },
              child: const Text("Alerta"),
            ),
            Divider(),
            RaisedButton(
              onPressed: () async {
                showError(context,
                    "Mensagem de erro"
                );
              },
              child: const Text("Erro"),
            ),
            Divider(),
            RaisedButton(
              onPressed: () async {
                _confirmado = await confirm(context,
                  "Confirmar acao?"
                );
                setState(() {});
              },
              child: const Text("Confirmacao"),
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