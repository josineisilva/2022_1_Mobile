import 'package:shared_preferences/shared_preferences.dart';

class Config {
  static final Config _instance = Config.internal();
  factory Config() => _instance;
  Config.internal();

  SharedPreferences? _prefs;
  String? _host;

  String getHost() => _host!;

  init() async {
    _prefs = await SharedPreferences.getInstance();
    if ( !_prefs!.containsKey('host') ) {
      _prefs!.setString('host', 'student-jwt.herokuapp.com');
    }
    load();
  }

  load() {
    _host = _prefs!.getString("host");
  }

  save(String host) {

    print("Salvando a configuracao ${host}");

    _prefs!.setString('host', host);
    load();
  }
}