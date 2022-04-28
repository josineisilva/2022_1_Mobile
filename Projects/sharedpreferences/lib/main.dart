import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'pages/home.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences _prefs = await SharedPreferences.getInstance();
  if ( !_prefs.containsKey("counter") )
    _prefs.setInt('counter', 0);

  runApp(MyApp(_prefs));
}

class MyApp extends StatelessWidget {
  SharedPreferences _prefs;

  MyApp(this._prefs) : super();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(prefs:_prefs),
    );
  }
}
