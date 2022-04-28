import 'package:flutter/material.dart';
import 'dart:convert';
import 'detail.dart';
import '../models/student.dart';
import '../blocs/student_bloc.dart';
import '../utils/confirm.dart';
import '../utils/showerror.dart';
import '../utils/wait.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Chave para o Scaffold
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  // Widget de indicacao de espera
  final WaitWidget _waitWidget = WaitWidget();
  // BLoC para estudantes
  StudentBLoC _bloc = StudentBLoC();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("PostgreSQL"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            tooltip: 'Inserir',
            onPressed: () => _detail(context, null),
          ),
        ],
      ),
      body: StreamBuilder<List<Student>>(
        stream: _bloc.stream,
        builder: (context, snapshot) {
          print("Recriando lista de alunos");
          if (snapshot.hasData ) {
            if (snapshot.data!.length>0) {
              return RefreshIndicator(
                onRefresh: _refreshData,
                child: ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return Dismissible(
                      key: Key(
                        "${snapshot.data![index].id}${snapshot.data![index].name}"
                      ),
                      onDismissed: (direction) {
                        _scaffoldKey.currentState?.showSnackBar(
                          SnackBar(content:
                            Text("Removido ${snapshot.data![index].name}")
                          )
                        );
                        setState(() => snapshot.data!.removeAt(index));
                      },
                      background: Container(color: Colors.red),
                      child: ListTile(
                        title: Text('${snapshot.data![index].name}'),
                        subtitle: Text('Age: ${snapshot.data![index].age}'),
                        trailing: Text('ID: ${snapshot.data![index].id}'),
                        onTap: () =>
                          _detail(context, snapshot.data![index].id!),
                      ),
                      confirmDismiss: (DismissDirection direction) async {
                        bool delete = await confirm(context,
                          "Deletar ${snapshot.data![index].id} ${snapshot.data![index].name}?"
                        );
                        if (delete) {
                          String _errorMsg = "";
                          int _deleted = await _bloc.delete(
                            snapshot.data![index].id!
                          ).catchError((_error) {
                            _errorMsg = _error;
                          });
                          if ( _deleted == null ) {
                            delete = false;
                            showError(context, _errorMsg);
                          } else {
                            if (_deleted != 1) {
                              delete = false;
                              print("Erro na delecao");
                            }
                          }
                        }
                        return delete;
                      },
                    );
                  }
                ),
              );
            } else {
              return Center(
                child: Text("No Data",
                  style: Theme.of(context).textTheme.displayMedium,
                )
              );
            }
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
                style: Theme.of(context).textTheme.displayMedium,
              ),
            );
          } else {
            _bloc.firstCall();
            return _waitWidget;
          }
        }
      ),
    );
  }

  Future _refreshData() async {
    _bloc.getAll();
  }

  //
  // Chama a tela de edicao do estudante
  //
  _detail(BuildContext context, int? id) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Detail(id: id)),
    );
    _bloc.getAll();
  }

  dispose() {
    _bloc.dispose();
  }
}
