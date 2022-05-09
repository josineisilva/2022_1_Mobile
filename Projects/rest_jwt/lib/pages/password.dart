import 'package:flutter/material.dart';
import '../models/session.dart';
import '../database/database.dart';
import '../utils/showerror.dart';
import '../utils/showalert.dart';

//
// Classe para resetar a senha
//
class Password extends StatelessWidget {
  final GlobalKey<FormState> _formStateKey = GlobalKey<FormState>();
  Session _session = Session.empty();
  String? _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Password Reset"),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Form(
              key: _formStateKey,
              autovalidateMode: AutovalidateMode.always,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      initialValue: _session.email,
                      decoration: InputDecoration(labelText: 'Email',),
                      validator: (value) => _validateEmail(value!),
                      onSaved: (value) => _session.email = value,
                    ),
                  ],
                ),
              ),
            ),
            RaisedButton(
              onPressed: () => _reset(context),
              color: Colors.blue[300],
              child: Text("Reset")
            ),
          ],
        ),
      )
    );
  }

  //
  // Valida o email
  //
  String? _validateEmail(String value) {
    String? ret;
    value = value.trim();
    if (value.isEmpty)
      ret = "Email e obrigatorio";
    else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value))
      ret = "Email inválido";
    return ret;
  }

  //
  // Reseta a senha
  //
  void _reset(BuildContext context) async {
    print("Reset");
    String? _errorMsg;
    if (_formStateKey.currentState!.validate()) {
      _formStateKey.currentState!.save();
      var _done = await DatabaseHelper.passwordReset(
          _session.toJson()
      ).catchError((_error) {
        _errorMsg = _error;
      });
      _done ??= false;
      if (_done) {
        showAlert(context, "Antes de prosseguir, acesse o e-mail indicado e altere a senha");
        Navigator.pop(context);
      } else
        showError(context, _errorMsg!);
    }
  }
}
