import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'dart:math';

//
// Modelo para cor do estado
//
class ColorModel with ChangeNotifier {
  Color color = UniqueColorGenerator.getColor();

  void newColor() {
    color = UniqueColorGenerator.getColor();
    notifyListeners();
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
