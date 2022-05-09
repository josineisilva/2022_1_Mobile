import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/config.dart';

// TimeOut para as requicoes
const _TIMEOUT = Duration(seconds: 10);

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper.internal();

  static String? _host;

  static _setHost() {
    Config _config = Config();
    _host = _config.getHost().trim();
  }

  static Future<bool> initDb() async {
    print("Database initDb");
    _setHost();
    return true;
  }

  static Future<List<Map>> getAll(String _table) async {
    print("Database getAll");
    List<Map> ret = List<Map>.empty(growable: true);
    String _errorMsg = "";
    final _response = await http.get(Uri.https("${_host}","/${_table}"))
      .timeout(_TIMEOUT)
      .catchError((_error) {_errorMsg = "${_error}";});
    if (_response != null) {
      print("Response ${_response.statusCode} ${_response.body}");
      if (_response.statusCode == 200) {
        final _parsed = json.decode(_response.body);
        for (int i = 0; i < _parsed.length; i++)
          ret.add(_parsed[i]);
      } else
        _errorMsg = responseError(_response, null);
    }
    if (ret != null)
      return ret;
    else
      return Future<List<Map>>.error(_errorMsg);
  }

  static Future<Map> getByID(String _table, int? _id) async {
    print("Database getByID");
    Map? ret;
    String _errorMsg = "";
    final _response = await http.get(Uri.https("${_host}","/${_table}/${_id}"))
      .timeout(_TIMEOUT)
      .catchError((_error) {_errorMsg = "${_error}";});
    if (_response != null) {
      print("Response ${_response.statusCode} ${_response.body}");
      if (_response.statusCode == 200)
        ret = json.decode(_response.body);
      else
        _errorMsg = responseError(_response, null);
    }
    if (ret != null)
      return ret;
    else
      return Future<Map>.error(_errorMsg);
  }

  static Future<int> insert(String _table, Map _map) async {
    print("Database insert");
    int? ret;
    String _errorMsg = "";
    _map.remove('id');
    final _response = await http.post(Uri.https("${_host}","/${_table}"),
        body: json.encode(_map),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json"
        },
        encoding: Encoding.getByName("utf-8")
      )
      .timeout(_TIMEOUT)
      .catchError((_error) {_errorMsg = "${_error}";});
    if (_response != null) {
      print("Response ${_response.statusCode} ${_response.body}");
      if (_response.statusCode == 201)
        ret = 1;
      else
        _errorMsg = responseError(_response, null);
    }
    if (ret != null)
      return ret;
    else
      return Future<int>.error(_errorMsg);
  }

  static Future<int> update(String _table, Map _map) async {
    print("Database update");
    int? ret;
    String _errorMsg = "";
    final _response = await http.put(Uri.https("${_host}","/${_table}/${_map['id']}"),
        body: json.encode(_map),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json"
        },
        encoding: Encoding.getByName("utf-8")
      )
      .timeout(_TIMEOUT)
      .catchError((_error) {_errorMsg = "${_error}";});
    if (_response != null) {
      print("Response ${_response.statusCode} ${_response.body}");
      if (_response.statusCode == 200)
          ret = 1;
      else
        _errorMsg = responseError(_response, null);
    }
    if (ret != null)
      return ret;
    else
      return Future<int>.error(_errorMsg);
  }

  static Future<int> delete(String _table, int _id) async {
    print("Database delete");
    int? ret;
    String _errorMsg = "";
    final _response = await http.delete(Uri.https("${_host}","/${_table}/${_id}"))
      .timeout(_TIMEOUT)
      .catchError((_error) {_errorMsg = "${_error}";});
    if (_response != null) {
      print("Response ${_response.statusCode} ${_response.body}");
      if (_response.statusCode == 200)
          ret = 1;
      else
        _errorMsg = responseError(_response, null);
    }
    if (ret != null)
      return ret;
    else
      return Future<int>.error(_errorMsg);
  }

  static String responseError(var _response, String? _body) {
    String ret = 'Bad status code ${_response.statusCode}.';
    _body ??= _response.body;
    if (_body != null )
      ret = ret+'\n${_body}';
    return ret;
  }

  void close() {
    print("CloseDB");
  }
}