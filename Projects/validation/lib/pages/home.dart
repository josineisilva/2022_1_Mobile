import 'package:flutter/material.dart';

//
// Classe para os dados do pedido
//
class Order {
  late String item;
  late int quantity;
}

//
// Classe para o formulario dos dados
//
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

//
// Classe para gerenciar o estado do formulario
//
class _HomeState extends State<Home> {
  // Chave para o formulario
  final GlobalKey<FormState> _formStateKey = GlobalKey<FormState>();
  // Chave para o Scaffold do formulario
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  // Dados do pedido
  Order _order = Order();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Form Validation'),
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
                      decoration: InputDecoration(
                        hintText: 'Nome',
                        labelText: 'Item',
                      ),
                      validator: (value) => _validateItem(value!),
                      onSaved: (value) {
                        print("Salvando item");
                        _order.item = value!;
                      },
                    ),
                    TextFormField(
                      decoration:  InputDecoration(
                        hintText: '1',
                        labelText: 'Quantidade',
                      ),
                      validator: (value) => _validateQuantity(value!),
                      onSaved: (value) {
                        print("Salvando quantidade");
                        _order.quantity = int.parse(value!);
                      }
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
            onPressed: () => _submitOrder(),
            child: Text('Save')
          ),
        ],
      ),
    );
  }

  //
  // Valida o nome do item
  //
  String? _validateItem(String value) {
    String? ret;
    value = value.trim();
    print("Validando item [${value}]");
    if ( value.isEmpty )
      ret = "Nome e obrigatorio";
    return ret;
  }

  //
  // Valida a quantidade
  //
  String? _validateQuantity(String value) {
    String? ret;
    value = value.trim();
    print("Validando quantidade [${value}]");
    if ( value.isEmpty )
      ret = "Quantidade e obrigatoria";
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

  //
  // Verifica e salva os dados do formulario
  //
  _submitOrder() {
    if(_formStateKey.currentState!.validate()) {
      _formStateKey.currentState?.save();
      print('Order Item: ${_order.item}');
      print('Order Quantity: ${_order.quantity}');
      _scaffoldKey.currentState?.showSnackBar(
         SnackBar(content: Text('Processando pedido'))
      );
    }
  }
}
