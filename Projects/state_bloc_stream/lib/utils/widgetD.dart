import 'package:flutter/material.dart';
import '../blocs/bloc.dart';

//
// Widget para exibir a cor
//
class WidgetD extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MyBLoC bloc = MyBLoC();
    print("Criando WidgetD");
    return StreamBuilder<Color>(
      stream: bloc.colorStream,
      initialData: bloc.color,
      builder: (context, snapshot) {
        print("Recriando ListTile do WindgetD");
        if (snapshot.hasError) {
          return Text('Há um erro na Stream');
        } else {
          return Container(
            color: snapshot.data,
            child: ListTile(
              title: Text('Cor '),
            ),
          );
        }
      }
    );
  }
}
