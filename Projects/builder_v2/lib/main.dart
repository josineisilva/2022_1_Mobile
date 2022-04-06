import 'package:flutter/material.dart';

void main() => runApp(MyApp());

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

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Builder"),
      ),
      body: Container(),
      floatingActionButton: Builder(builder: (BuildContext context) {
        return FloatingActionButton(onPressed: () {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.blue,
              content: Text('SnackBar'),
            ),
          );
        });
      }),
    );
  }
}
