import 'package:flutter/foundation.dart';

//
// Modelo para contador do estado
//
class CountModel with ChangeNotifier {
  int count = 0;

  void inc() {
    count = count + 1;
    notifyListeners();
  }
}