import 'dart:async';
import '../models/user.dart';
import '../dao/user_dao.dart';

class UserBLoC {
  static final UserBLoC _singleton = UserBLoC._internal();
  final UserDao _dao = UserDao();

  factory UserBLoC() => _singleton;

  UserBLoC._internal();

  Future<int> insert(User user) async {
    print("BLoC insert");
    int ret = await _dao.insert(user);
    if (ret != null)
      return ret;
    else
      return Future<int>.error(_dao.errorMsg);
  }
}