import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'models/config.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Config _config = Config();
  await _config.init();
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
      home: Home(),
    );
  }
}