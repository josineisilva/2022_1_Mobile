import 'package:flutter/material.dart';
import '../models/vehicletype.dart';
import '../models/vehicle.dart';

//
// Classe para selecao do veiculo
//
class SelectRoute extends StatelessWidget {
  final Type type;

  SelectRoute({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Lista de veiculos a exibir
    List<Widget> Cards = [];
    // Seleciona os veiculos a exibir
    for (var i = 0; i < VehicleList.length; i++) {
      if ( (this.type==Type.All) || (VehicleList[i].type==this.type)) {
        Cards.add(
          Card(
            child: FlatButton(
              onPressed: () => Navigator.pop(context, i),
              child: Image.asset(VehicleList[i].image),
            )
          ),
        );
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          TypeList.firstWhere(
            (i) => i.type == this.type
          ).title
        ),
      ),
      body: GridView.count(
        padding: EdgeInsets.all(8.0),
        crossAxisCount: 2,
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        children: Cards,
      )
    );
  }
}
