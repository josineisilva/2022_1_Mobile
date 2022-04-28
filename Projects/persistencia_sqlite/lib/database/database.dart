import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper.internal();

  static Database? _db;

  static Future<bool> initDb() async {
    if ( _db == null ) {
      print("InitDB");
      String _errorMsg = "";
      String _path = await getDatabasesPath() + 'example';
      _db = await openDatabase(
        _path,
        version: 1,
        onCreate: _onCreate
      ).catchError((_error) {
        _errorMsg = _error.message;
      });
      if ( _db == null )
        return Future<bool>.error(_errorMsg);
    }
    return true;
  }

  static void _onCreate(Database db, int version) async {
    print("CreateDB");
    await db.execute('''CREATE TABLE student(
      id INTEGER PRIMARY KEY,
      name TEXT,
      age INTEGER,
      email TEXT)'''
    );
  }

  static Future<List<Map>> getAll(String _table) async {
    print("Database getAll");
    List<Map> ret;
    String _errorMsg = "";
    ret = await _db!.query(_table).catchError((_error) {
      _errorMsg = _error.message;
    });
    if (ret != null)
      return ret;
    else
      return Future<List<Map>>.error(_errorMsg);
  }

  static Future<Map> getByID(String _table, int? _id) async {
    print("Database getByID");
    Map ret;
    String _errorMsg = "";
    var _rows = await _db!.query(
      _table,
      where: "id = ?",
      whereArgs: [_id]
    ).catchError((_error) {
      _errorMsg = _error.message;
    });
    if ( _rows != null ) {
      if (_rows.isNotEmpty)
        ret = _rows.first;
      else
        ret = Map();
      return ret;
    } else
      return Future<Map>.error(_errorMsg);
  }

  static Future<int> insert(String _table, Map _map) async {
    print("Database insert");
    int? ret;
    String _errorMsg = "";
    var _max = await _db!.rawQuery(
      "SELECT MAX(id)+1 as id FROM ${_table}"
    ).catchError((_error) {
      _errorMsg = _error.message;
    });
    if (_errorMsg == "") {
      String max_id = _max.first["id"].toString();
      if ( max_id == "null" )
        max_id = "1";
      int? _id = int.parse(max_id);
      _map['id'] = _id;
      ret = await _db!.insert(
        _table,
        Map<String,dynamic>.from(_map)
      ).catchError((_error) {
        _errorMsg = _error.message;
      });
    }
    if (ret != null)
      return ret;
    else
      return Future<int>.error(_errorMsg);
  }

  static Future<int> update(String _table, Map _map) async {
    print("Database update");
    int ret;
    String _errorMsg = "";
    ret = await _db!.update(
      _table,
      Map<String,dynamic>.from(_map),
      where: 'id = ?',
      whereArgs: [_map['id']],
    ).catchError((_error) {
      _errorMsg = _error.message;
    });
    if (ret != null)
      return ret;
    else
      return Future<int>.error(_errorMsg);
  }

  static Future<int> delete(String _table, int _id) async {
    print("Database delete");
    int ret;
    String _errorMsg = "";
    ret = await _db!.delete(
      _table,
      where: 'id = ?',
      whereArgs: [_id]
    ).catchError((_error) {
      _errorMsg = _error.message;
    });
    if (ret != null)
      return ret;
    else
      return Future<int>.error(_errorMsg);
  }

  void close() {
    print("CloseDB");
    if (_db != null) _db!.close();
  }
}
