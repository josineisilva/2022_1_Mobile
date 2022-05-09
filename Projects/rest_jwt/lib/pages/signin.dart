import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import '../models/session.dart';
import '../models/user.dart';
import '../database/database.dart';
import 'configuration.dart';
import 'password.dart';
import 'register.dart';
import 'home.dart';
import '../utils/showerror.dart';

//
// Classe para sigin no Web Service
//
class SignIn extends StatelessWidget {
  final GlobalKey<FormState> _formStateKey = GlobalKey<FormState>();
  Session _session = Session.empty();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            tooltip: 'Configuracao',
            onPressed: () async {
              await Navigator.push(context,
                MaterialPageRoute(builder: (context) => Configuration()),
              );
              DatabaseHelper.initDb();
            },
          ),
        ],
      ),
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
                    TextFormField(
                      initialValue: _session.password,
                      decoration: InputDecoration(labelText: 'Password',),
                      obscureText: true,
                      validator: (value) => _validatePassword(value!),
                      onSaved: (value) => _session.password = value,
                    ),
                  ],
                ),
              ),
            ),
            RaisedButton(
              onPressed: () => _signin(context),
              color: Colors.blue[300],
              child: Text("Log In")
            ),
            FlatButton(
              onPressed: () => _password(context),
              child: Text("Esqueceu sua Senha?")
            ),
            FlatButton(
              onPressed: () => _register(context),
              child: Text("Novo Usuario")
            )
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
  // Valida a password
  //
  String? _validatePassword(String value) {
    String? ret;
    value = value.trim();
    if (value.isEmpty)
      ret = "Pasword e obrigatoria";
    else if(value.length < 4)
      ret = "Minimo de 4 caracteres";
    return ret;
  }

  //
  // Autenticar o usuario
  //
  void _signin(BuildContext context) async {
    if (_formStateKey.currentState!.validate()) {
      _formStateKey.currentState!.save();
      _getJwt(context);
    }
  }

  //
  // Resetar senha
  //
  void _password(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Password()),
    );
  }

  //
  // Registrar um novo usuario
  //
  void _register(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Register()),
    );
  }

  //
  // Obtem o token de autenticacao
  //
  void _getJwt(BuildContext context) async {
    String _errorMsg = "";
    var _jwt = await DatabaseHelper.signin(
        _session.toJson()
    ).catchError((_error) {
      _errorMsg = _error;
    });
    if(_jwt != null) {
      print("JWT ${_jwt}");
      Map<String, dynamic> decodedToken = JwtDecoder.decode(_jwt);
      decodedToken.forEach((k,v) => print('${k}: ${v}'));
      DatabaseHelper.setToken(_jwt);
      Navigator.pushReplacement(context,
        MaterialPageRoute(
          builder: (BuildContext context) => Home()
        )
      );
    }
    else
      showError(context, _errorMsg);
  }
}
