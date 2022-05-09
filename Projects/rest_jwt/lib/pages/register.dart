import 'package:flutter/material.dart';
import '../models/user.dart';
import '../blocs/user_bloc.dart';
import '../utils/showerror.dart';
import '../utils/showalert.dart';

//
// Classe para registrar um novo usuario
//
class Register extends StatelessWidget {
  final GlobalKey<FormState> _formStateKey = GlobalKey<FormState>();
  UserBLoC _bloc = UserBLoC();
  User _user = User.empty();
  String? _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text("Registration"),),
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
                      initialValue: _user.name,
                      decoration: InputDecoration(labelText: 'Nome',),
                      validator: (value) => _validateName(value!),
                      onSaved: (value) => _user.name = value,
                    ),
                    TextFormField(
                      initialValue: _user.email,
                      decoration: InputDecoration(labelText: 'Email',),
                      validator: (value) => _validateEmail(value!),
                      onSaved: (value) => _user.email = value,
                    ),
                    TextFormField(
                      initialValue: _user.password,
                      decoration: InputDecoration(labelText: 'Password',),
                      obscureText: true,
                      validator: (value) => _validatePassword(value!),
                      onSaved: (value) => _user.password = value,
                    ),
                    TextFormField(
                      initialValue: _user.confirm,
                      decoration: InputDecoration(labelText: 'Confirmacao da Passsword',),
                      obscureText: true,
                      validator: (value) => _validateConfirm(value!),
                      onSaved: (value) => _user.confirm = value,
                    ),
                  ],
                ),
              ),
            ),
            RaisedButton(
              onPressed: () => _register(context),
              color: Colors.blue[300],
              child: Text("Register")
            ),
          ],
        ),
      )
    );
  }

  //
  // Valida o nome
  //
  String? _validateName(String value) {
    String? ret;
    value = value.trim();
    if (value.isEmpty)
      ret = "Nome e obrigatorio";
    return ret;
  }

  //
  // Valida o email
  //
  String? _validateEmail(String value) {
    String? ret;
    value = value.trim();

    print("ValidadeEmail");

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
    _password = value;
    if (value.isEmpty)
      ret = "Pasword e obrigatoria";
    else if(value.length < 4)
      ret = "Minimo de 4 caracteres";
    return ret;
  }

  //
  // Valida a confirmacao da password
  //
  String? _validateConfirm(String value) {
    String? ret;
    value = value.trim();
    if (value.compareTo(_password!)!=0)
      ret = "Pasword nao confere";
    return ret;
  }

  //
  // Cadastra um novo usuario
  //
  void _register(BuildContext context) async {
    print("Register");
    String? _errorMsg;
    if (_formStateKey.currentState!.validate()) {
      _formStateKey.currentState!.save();
      var value = await _bloc.insert(_user).catchError((_error) {
        _errorMsg = _error;
      });
      value ??= 0;
      if (value > 0) {
        showAlert(context, "Antes de prosseguir, acesse o e-mail indicado e faça a verificacao do cadastro");
        Navigator.pop(context);
      } else
        showError(context, _errorMsg!);
    }
  }
}