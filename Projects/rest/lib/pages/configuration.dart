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

  @override
  Widget build(BuildContext context) {
    _host = _config.getHost();
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

  _submit() {
    if(_formStateKey.currentState!.validate()) {
      _formStateKey.currentState?.save();
      _config.save(_host!);
      Navigator.pop(context);
    }
  }
}
