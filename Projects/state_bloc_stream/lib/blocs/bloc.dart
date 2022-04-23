import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

class MyBLoC {
  static final MyBLoC _singleton = MyBLoC._internal();
  final _countController = StreamController<int>.broadcast();
  final _colorController = StreamController<Color>.broadcast();
  int _count = 0;
  Color _color = UniqueColorGenerator.getColor();

  factory MyBLoC() => _singleton;

  MyBLoC._internal() {
//    _count = 0;
//    _color = UniqueColorGenerator.getColor();
  }

  int get count => _count;
  Color get color => _color;
  Stream<int> get countStream => _countController.stream;
  Stream<Color> get colorStream => _colorController.stream;

  void inc() {
    _count++;
    _countController.add(_count);
  }

  void newColor() {
    _color = UniqueColorGenerator.getColor();
    _colorController.add(_color);
  }

  void dispose(){
    _countController.close();
    _colorController.close();
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
