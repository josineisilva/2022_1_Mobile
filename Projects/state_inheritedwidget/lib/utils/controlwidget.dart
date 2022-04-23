import 'package:flutter/material.dart';
import '../models/item.dart';

class ControlWidget extends StatefulWidget {

  ControlWidget({Key? key,required this.child,}):
    super(key: key);

  // Subarvore a ser criada sob o InheritedWidget
  final Widget child;

  @override
  ControlWidgetState createState() => ControlWidgetState();

  // Permite acesso a _MyInheritedWidget
  static ControlWidgetState of(BuildContext context){
    return (context.dependOnInheritedWidgetOfExactType<_MyInheritedWidget>()
      as _MyInheritedWidget
    ).data;
  }
}

class ControlWidgetState extends State<ControlWidget>{
  List<Item> _items = <Item>[];
  int get itemsCount => _items.length;

  void addItem(String reference){
    setState((){
      _items.add(Item(reference));
    });
  }

  @override
  Widget build(BuildContext context){
    print("Recriando ControlWidget");
    return _MyInheritedWidget(
      data: this,
      child: widget.child,
    );
  }
}

//
// InheritedWidget
//
class _MyInheritedWidget extends InheritedWidget {
  _MyInheritedWidget({
    Key? key,
    required Widget child,
    required this.data,
  }): super(key: key, child: child);

  // Acesso ao State do MyInheritedWidget
  final ControlWidgetState data;

  // Determina se os widgets registrados devem ser recriados
  @override
  bool updateShouldNotify(_MyInheritedWidget oldWidget) {
    return true;
  }
}
