import 'package:flutter/material.dart';
import 'select.dart';
import '../models/vehicletype.dart';
import '../models/vehicle.dart';

//
// Classe para a tela de selecao do tipo de veiculo
//
class ShowRoute extends StatefulWidget {
  @override
  _ShowRouteState createState() => _ShowRouteState();
}

//
// Classe para gerenciar o estado da tela de selecao do tipo de veiculo
//
class _ShowRouteState extends State<ShowRoute> {
  // Tipo de veiculo selecionado
  Type dropdownValue = Type.All;
  // Indice do veiculo selecinado
  int? selected = null;

  //
  // Constroi o widget da tela de selecao do veiculo
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Veiculo'),
      ),
      body: Column(children: <Widget>[
        // Widget para selecao do tipo de veiculo
        DropdownButton<Type>(
          value: dropdownValue,
          icon: Icon(Icons.arrow_downward),
          iconSize: 24,
          elevation: 16,
          underline: Container(
            height: 2,
          ),
          onChanged: (Type? newValue) {
            setState(() {
              dropdownValue = newValue!;
            });
            _select(context,dropdownValue);
          },
          items: TypeList.map<DropdownMenuItem<Type>>((VehicleType item) {
            return DropdownMenuItem<Type>(
              value: item.type,
              child: Text(item.title),
            );
          }).toList(),
        ),
        Divider(),
        // Widget com os dados do veiculo selecionado
        selected == null ? Container() :
          Card(
            child: ListTile(
              leading: Icon(
                TypeList.firstWhere(
                  (i) => i.type == VehicleList[selected!].type
                ).icon,
                color: Colors.blue,
                size: 52.0,
              ),
              title: Text(
                VehicleList[selected!].model
              ),
              subtitle: Text(
                  VehicleList[selected!].make+'\n'+
                  VehicleList[selected!].year
              ),
              isThreeLine: true,
            ),
          ),
        Divider(),
        // Imagem do veiculo selecionado
        selected == null ? Container() :
          Image.asset(VehicleList[selected!].image),
      ]),
    );
  }

  //
  // Chama a tela de selecao dos veiculos
  //
  _select(BuildContext context, Type type) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SelectRoute(type: type)),
    );
    if ( result != null)
    {
      setState(() {
        selected = result;
      });
    }
  }
}