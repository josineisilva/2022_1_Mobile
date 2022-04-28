import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/birthdays.dart';
import 'pages/gratitude.dart';
import 'pages/reminders.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BottomNavigationBar',
      // Rotas da aplicacao
      routes: {
        '/': (context) => Home(),
        '/birthdays': (context) => Birthdays(),
        '/gratitude': (context) => Gratitude(),
        '/reminders': (context) => Reminders(),
      },
      // Tela inicial da aplicacao
      initialRoute: '/',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}