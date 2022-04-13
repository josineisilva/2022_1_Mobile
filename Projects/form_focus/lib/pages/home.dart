import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/user.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State {
  // Chave para o formulario
  final GlobalKey<FormState> _formStateKey = GlobalKey<FormState>();
  // Chave para o Scaffold
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  // Chave para o widget do nome
  final GlobalKey<FormFieldState> _nomeKey = GlobalKey<FormFieldState>();
  // Chave para o widget da idade
  final GlobalKey<FormFieldState> _idadeKey = GlobalKey<FormFieldState>();
  // Modelo de dados
  final _user = User();
  // Scopo de foco para a aplicacao
  late FocusScopeNode _focusScopeNode;
  // Gerenciar o foco do widget para nome
  late FocusNode _nomeFocusNode;
  // Gerenciar o foco do widget para idade
  late FocusNode _idadeFocusNode;

  @override
  void initState() {
    super.initState();
    _nomeFocusNode = FocusNode();
    _idadeFocusNode = FocusNode();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_nomeFocusNode);
    });
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    _nomeFocusNode.dispose();
    _idadeFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool hardware = _user.preferencias[User.PreferenciasHardware];
    bool desenvolvimento = _user.preferencias[User.PreferenciasDesenvolvimento];
    bool redes = _user.preferencias[User.PreferenciasRedes];
    _focusScopeNode = FocusScope.of(context);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: Text('Profile')),
      body: Container(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          child: Builder(
              builder: (context) => Form(
                  key: _formStateKey,
                  autovalidateMode: AutovalidateMode.always,
                  child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          TextFormField(
                            key: _nomeKey,
                            focusNode: _nomeFocusNode,
                            initialValue: _user.nome,
                            decoration: InputDecoration(labelText: 'Nome'),
                            validator: (value) => _validateNome(value!),
                            onSaved: (value) =>
                                setState(() => _user.nome = value!),
                          ),
                          TextFormField(
                            key: _idadeKey,
                            focusNode: _idadeFocusNode,
                            initialValue: (_user.idade ?? 0) >= 18
                                ? _user.idade.toString()
                                : '',
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(labelText: 'Idade'),
                            validator: (value) => _validateIdade(value!),
                            onSaved: (value) => setState(
                                () => _user.idade = int.tryParse(value!)),
                          ),
                          Divider(),
                          FormField(
                              validator: (value) =>
                                  _validateEstCiv(value as String?),
                              onSaved: (value) => setState(
                                  () => _user.estciv = value as String?),
                              initialValue: _user.estciv,
                              builder: (FormFieldState<String> state) {
                                return Column(children: <Widget>[
                                  ListTile(
                                    title: Text('Estado Civil:'),
                                  ),
                                  RadioListTile<String>(
                                    title: const Text('Solteiro'),
                                    value: 'solteiro',
                                    groupValue: state.value,
                                    onChanged: (value) =>
                                        state.didChange(value),
                                  ),
                                  RadioListTile<String>(
                                    title: const Text('Casado'),
                                    value: 'casado',
                                    groupValue: state.value,
                                    onChanged: (value) =>
                                        state.didChange(value),
                                  ),
                                  RadioListTile<String>(
                                    title: const Text('Outro'),
                                    value: 'outro',
                                    groupValue: state.value,
                                    onChanged: (value) =>
                                        state.didChange(value),
                                  ),
                                  state.hasError
                                      ? Text(
                                          state.errorText!,
                                          style: TextStyle(color: Colors.red),
                                        )
                                      : Container()
                                ]);
                              }),
                          Divider(),
                          FormField(
                              validator: (value) =>
                                  _validateAtuacao(value as String?),
                              onSaved: (value) => setState(
                                  () => _user.atuacao = value as String?),
                              initialValue: _user.atuacao,
                              builder: (FormFieldState<String> state) {
                                return Column(children: <Widget>[
                                  ListTile(
                                    title: Text('Atuacao'),
                                    trailing: DropdownButton<String>(
                                      value: state.value,
                                      icon: Icon(Icons.arrow_downward),
                                      iconSize: 24,
                                      elevation: 16,
                                      onChanged: (value) =>
                                          state.didChange(value),
                                      items: _user.Atuacao.map<
                                              DropdownMenuItem<String>>(
                                          (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                  state.hasError
                                      ? Text(
                                          state.errorText!,
                                          style: TextStyle(color: Colors.red),
                                        )
                                      : Container()
                                ]);
                              }),
                          Divider(),
                          FormField(
                              onSaved: (value) => setState(
                                  () => _user.newsletter = value as bool?),
                              initialValue: _user.newsletter ?? false,
                              builder: (FormFieldState<bool> state) {
                                return SwitchListTile(
                                    title: const Text('Enviar Newsletter'),
                                    value: state.value!,
                                    onChanged: (bool value) =>
                                        state.didChange(value));
                              }),
                          Divider(),
                          FormField(
                              onSaved: (value) => setState(() => _user
                                      .preferencias[User.PreferenciasHardware] =
                                  value),
                              initialValue: hardware ?? false,
                              builder: (FormFieldState<bool> state) {
                                return CheckboxListTile(
                                    title: const Text('Hardware'),
                                    value: state.value,
                                    onChanged: (bool? value) =>
                                        state.didChange(value));
                              }),
                          FormField(
                              onSaved: (value) => setState(() => _user
                                      .preferencias[
                                  User.PreferenciasDesenvolvimento] = value),
                              initialValue: desenvolvimento ?? false,
                              builder: (FormFieldState<bool> state) {
                                return CheckboxListTile(
                                    title: const Text('Desenvolvimento'),
                                    value: state.value,
                                    onChanged: (bool? value) =>
                                        state.didChange(value));
                              }),
                          FormField(
                              onSaved: (value) => setState(() =>
                                  _user.preferencias[User.PreferenciasRedes] =
                                      value),
                              initialValue: redes ?? false,
                              builder: (FormFieldState<bool> state) {
                                return CheckboxListTile(
                                    title: const Text('Redes'),
                                    value: state.value,
                                    onChanged: (bool? value) =>
                                        state.didChange(value));
                              }),
                        ]),
                  )))),
      bottomNavigationBar: ButtonBar(
        alignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          RaisedButton(onPressed: () => _user.show(), child: Text('Exibir')),
          RaisedButton(onPressed: () => _submit(), child: Text('Save')),
        ],
      ),
    );
  }

  //
  // Validar o nome
  //
  String? _validateNome(String value) {
    String? ret;
    value = value.trim();
    if (value.isEmpty) ret = "Enter com o nome";
    return ret;
  }

  //
  // Validar a idade
  //
  String? _validateIdade(String value) {
    String? ret;
    value = value.trim();
    if (value.isEmpty)
      ret = "Idade e obrigatoria";
    else {
      int? _valueAsInteger = int.tryParse(value);
      if (_valueAsInteger == null)
        ret = "Valor invalido";
      else {
        if (_valueAsInteger < 18) ret = "Valor deve ser maior que 18";
      }
    }
    return ret;
  }

  //
  // Validar o estado civil
  //
  String? _validateEstCiv(String? value) {
    String? ret;
    if (value == null) ret = "Enter com o estado civil";
    return ret;
  }

  //
  // Validar a atuacao
  //
  String? _validateAtuacao(String? value) {
    String? ret;
    if (value == null) ret = "Enter com a atuacao";
    return ret;
  }

  //
  // Verifica e salva os dados do formulario
  //
  _submit() {
    if (_formStateKey.currentState!.validate()) {
      _formStateKey.currentState?.save();
      _user.save();
      _user.show();
      _scaffoldKey.currentState
          ?.showSnackBar(SnackBar(content: Text('Submitting form')));
    } else {
      if (!_nomeKey.currentState!.validate())
        _focusScopeNode.requestFocus(_nomeFocusNode);
      else if (!_idadeKey.currentState!.validate())
        _focusScopeNode.requestFocus(_idadeFocusNode);
    }
  }
}
