import 'package:flutter/material.dart';
import 'dart:math';

// Aspectos do InheritedModel
enum ASPECTS {
  NUMBER,
  COLOR,
}

class ControlWidget extends StatefulWidget {

  ControlWidget({Key? key, required this.child}):
    super(key: key);

  // Subarvore a ser criada sob o InheritedWidget
  final Widget child;

  @override
  State<StatefulWidget> createState() => ControlWidgetState();
}

class ControlWidgetState extends State<ControlWidget> {
  // Contador do estado
  late int _count;
  // Cor do estado
  late Color _color;

  @override
  void initState() {
    super.initState();
    _count = 0;
    _color = UniqueColorGenerator.getColor();
  }

  @override
  Widget build(BuildContext context) {
    print("Recriando ControlWidget");
    return MyInheritedModel(
      count: _count,
      color: _color,
      child: widget.child,
    );
  }

  // Incrementar o contador
  void inc(){
    setState((){
      _count = _count+1;
    });
  }

  // Alterar a cor
  void newColor(){
    setState((){
      _color = UniqueColorGenerator.getColor();
    });
  }
}

class MyInheritedModel extends InheritedModel<ASPECTS> {
  final int count;
  final Color color;

  MyInheritedModel({
    required this.count,
    required this.color,
    required Widget child,
  }) : super(child: child);

  @override
  bool updateShouldNotify(MyInheritedModel old) {
    return count != old.count ||
      color != old.color;
  }

  @override
  bool updateShouldNotifyDependent(MyInheritedModel old, Set<ASPECTS> aspects) {
    return (aspects.contains(ASPECTS.NUMBER) && old.count != count) ||
      (aspects.contains(ASPECTS.COLOR) && old.color != color);
  }

  static MyInheritedModel? of(BuildContext context, {required ASPECTS aspect}) {
    return InheritedModel.inheritFrom<MyInheritedModel>(
      context,
      aspect: aspect
    );
  }
}

//
// Classe para gerar uma cor aleatoria
//
class UniqueColorGenerator {
  static Random random = Random();
  static Color getColor() {
    return Color.fromARGB(255, random.nextInt(255), random.nextInt(255), random.nextInt(255));
  }
}
