import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/config.dart';

class Configuration extends StatefulWidget {
  @override
  _ConfigurationState createState() => _ConfigurationState();
}

class _ConfigurationState extends State<Configuration> {
  // Chave para o formulario
  final GlobalKey<FormState> _formStateKey = GlobalKey<FormState>();
  Config _config = Config();
  String? _host;
  int? _port;
  String? _database;
  String? _username;
  String? _password;

  @override
  Widget build(BuildContext context) {
    _host = _config.getHost();
    _port = _config.getPort();
    _database = _config.getDatabase();
    _username = _config.getUsername();
    _password = _config.getPassword();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Configuration'),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Form(
              key: _formStateKey,
              autovalidateMode: AutovalidateMode.always,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      initialValue: _host,
                      decoration: InputDecoration(labelText: 'Host'),
                      validator: (value) => _validateString(value!, 'Host'),
                      onSaved: (value) => _host = value!,
                    ),
                    TextFormField(
                      initialValue: _port.toString(),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      keyboardType: TextInputType.number,
                      decoration:  InputDecoration(labelText: 'Port'),
                      validator: (value) => _validatePort(value!),
                      onSaved: (value) => _port = int.parse(value!)
                    ),
                    TextFormField(
                      initialValue: _database,
                      decoration: InputDecoration(labelText: 'Database'),
                      validator: (value) => _validateString(value!, 'Database'),
                      onSaved: (value) => _database = value!,
                    ),
                    TextFormField(
                      initialValue: _username,
                      decoration: InputDecoration(labelText: 'Username'),
                      validator: (value) => _validateString(value!, 'Username'),
                      onSaved: (value) => _username = value!,
                    ),
                    TextFormField(
                      initialValue: _password,
                      decoration: InputDecoration(labelText: 'Password'),
                      validator: (value) => _validateString(value!, 'Password'),
                      onSaved: (value) => _password = value!,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: ButtonBar(
        alignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          RaisedButton(
            color: Colors.blue[400],
            onPressed: () =>
                _formStateKey.currentState?.reset(),
            child: Text('Reset')
          ),
          RaisedButton(
              color: Colors.blue[400],
            onPressed: () => _submit(),
            child: Text('Save')
          ),
        ],
      ),
    );
  }

  String? _validateString(String value, String field) {
    String? ret;
    value = value.trim();
    if ( value.isEmpty )
      ret = "${field} e obrigatorio";
    return ret;
  }

  String? _validatePort(String value) {
    String? ret;
    value = value.trim();
    if ( value.isEmpty )
      ret = "Port e obrigatoria";
    else {
      int? _valueAsInteger = int.tryParse(value);
      if ( _valueAsInteger == null )
        ret = "Valor invalido";
      else {
        if ( _valueAsInteger <= 0 )
          ret = "Valor deve ser maior que zero";
      }
    }
    return ret;
  }

  _submit() {
    if(_formStateKey.currentState!.validate()) {
      _formStateKey.currentState?.save();
      _config.save(_host!, _port!, _database!, _username!, _password!);
      Navigator.pop(context);
    }
  }
}
