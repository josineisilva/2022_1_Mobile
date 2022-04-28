import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import '../models/student.dart';
import '../blocs/student_bloc.dart';
import '../utils/showerror.dart';
import '../utils/wait.dart';

//
// Classe para edicao do estudante
//
class Detail extends StatelessWidget {
  Detail({Key? key, this.id}) : super(key: key);

  // ID do usuario a editar
  final int? id;
  // Chave para o formulario
  final GlobalKey<FormState> _formStateKey = GlobalKey<FormState>();
  // Chave para o Scaffold do formulario
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  // Widget de indicacao de espera
  final WaitWidget _waitWidget = WaitWidget();
    // BLoC para estudantes
  StudentBLoC _bloc = StudentBLoC();
  // Dados do estudante
  Student? _student;

  @override
  Widget build(BuildContext context) {
    String title;
    if (id ==  null) {
      title = "Incluir";
      _student = Student.empty();
    } else {
      _student = null;
      title = "Editar";
    }
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(title),
      ),
      body: Builder(builder: (BuildContext context) {
        if (id == null) {
          return _editStudent();
        } else {
          return StreamBuilder<List<Student>>(
            stream: _bloc.stream,
            builder: (context, snapshot) {
              print("Pesquisando aluno");
              if (snapshot.hasData ) {
                if ((snapshot.data?.length ?? 0)> 0) {
                  _student = snapshot.data?.first;
                  return _editStudent();
                } else {
                  return Text('Erro carregando estudante');
                }
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(
                    'Error: ${snapshot.error}',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                );
              } else {
                _bloc.getByID(id);
                return _waitWidget;
              }
            }
          );
        }
      }),
      bottomNavigationBar: ButtonBar(
        alignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          RaisedButton(
              onPressed: () => _reset(),
              child: Text('Reset')
          ),
          RaisedButton(
              onPressed: () => _submit(context),
              child: Text('Save')
          ),
          RaisedButton(
            onPressed: () => Navigator.pop(context, null),
            child: Text('Cancel')
          ),
        ],
      ),
    );
  }

  //
  // Edita o estudante
  //
  SafeArea _editStudent() {
    SafeArea ret = SafeArea(
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
                    initialValue: _student?.name,
                    decoration: InputDecoration(labelText: 'Nome',),
                    validator: (value) => _validateName(value!),
                    onSaved: (value) => _student?.name = value,
                  ),
                  TextFormField(
                    initialValue: _student?.age.toString(),
                    inputFormatters:
                      [FilteringTextInputFormatter.digitsOnly],
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: 'Idade'),
                    onSaved: (value) => _student?.age = int.parse(value!),
                  ),
                  TextFormField(
                    initialValue: _student?.email,
                    decoration: InputDecoration(labelText: 'Email',),
                    onSaved: (value) => _student?.email = value,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
    return ret;
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
  // Reseta os dados do formulario
  //
  void _reset() {
    if (_student != null)
      _formStateKey.currentState!.reset();
  }

  //
  // Verifica e salva os dados do formulario
  //
  void _submit(BuildContext context) async {
    if ( _student != null ) {
      print("Salvando");
      String _errorMsg = "";
      if (_formStateKey.currentState!.validate()) {
        _formStateKey.currentState!.save();
        var value;
        if (id == null)
          value = await _bloc.insert(_student!)
            .catchError((_error) {
              _errorMsg = _error;
            });
        else
          value = await _bloc.update(_student!)
            .catchError((_error) {
              _errorMsg = _error;
            });
        value ??= 0;
        if (value > 0) {
          _scaffoldKey.currentState?.showSnackBar(
              SnackBar(content: Text('Salvo ${_student?.name}'))
          );
          Navigator.pop(context, true);
        } else
          showError(context, _errorMsg);
      }
    }
  }
}