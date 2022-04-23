import 'package:flutter/material.dart';
import '../blocs/bloc.dart';

//
// Widget para exibir contador
//
class WidgetC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MyBLoC bloc = MyBLoC();
    print("Criando WidgetC");
    return StreamBuilder<int>(
      stream: bloc.countStream,
      initialData: bloc.count,
      builder: (context, snapshot) {
        print("Recriando texto do WindgetC");
        if (snapshot.hasError) {
          return Text('Há um erro na Stream');
        } else {
          return ListTile(
            title: Text('Contador ${snapshot.data}'),
          );
        }
      }
    );
  }
}
