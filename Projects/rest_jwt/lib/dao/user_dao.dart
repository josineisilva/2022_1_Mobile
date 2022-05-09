import 'dart:async';
import '../models/user.dart';
import '../database/database.dart';

class UserDao {
  String _errorMsg = "";

  String get errorMsg => _errorMsg;

  Future<int> insert(User _user) async {
    print("DAO insert");
    int ret;
    _errorMsg = "";
    ret = await DatabaseHelper.insert(
      'usuario',
      _user.toJson()
    ).catchError((_error) {
      _errorMsg = _error;
    });
    return ret;
  }
}
