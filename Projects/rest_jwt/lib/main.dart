import 'package:flutter/material.dart';
import 'package:rest_jwt/pages/signin.dart';
import 'models/config.dart';
import 'database/database.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Config _config = Config();
  await _config.init();
  await DatabaseHelper.initDb();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SignIn(),
    );
  }
}