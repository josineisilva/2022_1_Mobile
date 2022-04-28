import 'package:shared_preferences/shared_preferences.dart';

class Config {
  static final Config _instance = Config.internal();
  factory Config() => _instance;
  Config.internal();

  SharedPreferences? _prefs;
  String? _host;
  int? _port;
  String? _database;
  String? _username;
  String? _password;

  String getHost() => _host!;
  int getPort() => _port!;
  String getDatabase() => _database!;
  String getUsername() => _username!;
  String getPassword() => _password!;

  init() async {
    _prefs = await SharedPreferences.getInstance();
    if ( !_prefs!.containsKey('host') ) {
      _prefs!.setString('host', '10.0.2.2');
      _prefs!.setInt('port', 0);
      _prefs!.setString('database', 'mobile');
      _prefs!.setString('username', 'mobile');
      _prefs!.setString('password', 'mobile');
    }
    load();
  }

  load() {
    _host = _prefs!.getString("host");
    _port = _prefs!.getInt("port");
    _database = _prefs!.getString("database");
    _username = _prefs!.getString("username");
    _password = _prefs!.getString("password");
  }

  save(String host, int port, String database, String username, String password) {

    print("Salvando a configuracao ${host} ${port} ${database} ${username} ${password}");

    _prefs!.setString('host', host);
    _prefs!.setInt('port', port);
    _prefs!.setString('database', database);
    _prefs!.setString('username', username);
    _prefs!.setString('password', password);
    load();
  }
}