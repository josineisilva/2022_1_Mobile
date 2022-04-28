import 'dart:async';
import '../models/student.dart';
import '../dao/student_dao.dart';

class StudentBLoC {
  static final StudentBLoC _singleton = StudentBLoC._internal();
  final _controller = StreamController<List<Student>>.broadcast();
  final StudentDao _dao = StudentDao();

  factory StudentBLoC() => _singleton;

  StudentBLoC._internal();

  Stream<List<Student>> get stream => _controller.stream;

  void firstCall() async {
    print("BLoC firstCall");
    bool _init = await _dao.init();
    if ( _init )
      getAll();
    else
      _controller.addError(_dao.errorMsg);
  }

  void getAll() async {
    print("BLoC getAll");
    List<Student>? _list = await _dao.getAll();
    if (_list != null)
      _controller.add(_list);
    else
      _controller.addError(_dao.errorMsg);
  }

  void getByID(int? _id) async {
    print("BLoC getByID");
    List<Student> _list = List<Student>.empty(growable: true);
    Student? _student = await _dao.getByID(_id);
    if (_student != null) {
      _list.add(_student);
      _controller.add(_list);
    } else
      _controller.addError(_dao.errorMsg);
  }

  Future<int> insert(Student student) async {
    print("BLoC insert");
    int ret = await _dao.insert(student);
    if (ret != null)
      return ret;
    else
      return Future<int>.error(_dao.errorMsg);
  }

  Future<int> update(Student student) async {
    print("BLoC update");
    int ret = await _dao.update(student);
    if (ret != null)
      return ret;
    else
      return Future<int>.error(_dao.errorMsg);
  }

  Future <int> delete(int _id) async {
    print("BLoC Delete");
    int ret = await _dao.delete(_id);
    if (ret != null)
      return ret;
    else
      return Future<int>.error(_dao.errorMsg);
  }

  void dispose(){
    _controller.close();
    _dao.close();
  }
}