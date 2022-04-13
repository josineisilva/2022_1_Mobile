import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';
import '../models/person.dart';

class Home extends StatelessWidget {
  // Chave para o formulario
  final GlobalKey<FormState> _formStateKey = GlobalKey<FormState>();
  Person _person =
    Person.fromJson({"name":"John Brown",
                     "addr1":"9621 Roberts Avenue",
                     "city":"Birmingham",
                     "state":"AL"});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Serialization"),
      ),
      body: Form(
        key: _formStateKey,
        autovalidateMode: AutovalidateMode.always,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: _person.name,
                decoration: InputDecoration(labelText: 'Name'),
                onSaved: (value) => _person.name = value,
              ),
              TextFormField(
                initialValue: _person.addressLine1,
                decoration: InputDecoration(labelText: 'Addr1'),
                onSaved: (value) => _person.addressLine1 = value,
              ),
              TextFormField(
                initialValue: _person.addressCity,
                decoration: InputDecoration(labelText: 'City'),
                onSaved: (value) => _person.addressCity = value,
              ),
              TextFormField(
                initialValue: _person.addressState,
                decoration: InputDecoration(labelText: 'State'),
                onSaved: (value) => _person.addressState = value,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ButtonBar(
        alignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          RaisedButton(
            onPressed: () => print(jsonEncode(_person)),
            child: Text('Json')
          ),
          RaisedButton(
            onPressed: () => Clipboard.setData(
              ClipboardData(text: "${json.encode(_person)}")),
            child: Text('Copy')
          ),
          RaisedButton(
            onPressed: () => _submit(),
            child: Text('Save')
          ),
        ],
      ),
    );
  }

  _submit() {
    print("Saving");
    _formStateKey.currentState?.save();
  }
}
