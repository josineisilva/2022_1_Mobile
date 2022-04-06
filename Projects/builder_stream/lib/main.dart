import 'package:flutter/material.dart';
import 'dart:async';

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
  int _counter = 0;
  StreamController<int> _events = StreamController<int>();

  @override
  Widget build(BuildContext context) {
    print("Criando Home");
    return Scaffold(
      appBar: AppBar(
        title: Text("StreamBuilder"),
      ),
      body: Center(
        child: StreamBuilder<int>(
          stream: _events.stream,
          builder: (context, snapshot) {
            print("Recriando StreamBuilder");
            if (snapshot.hasError) {
              return Text("Erro: ${snapshot.error}",
                style: Theme.of(context).textTheme.displayMedium,
              );
            } else if (!snapshot.hasData) {
              return Text("No data",
                style: Theme.of(context).textTheme.displayMedium,
              );
            } else {
              return Text("${snapshot.data.toString()}",
                style: Theme.of(context).textTheme.displayMedium,
              );
            }
          },
        ),
      ),
      bottomNavigationBar: ButtonBar(
        alignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          RaisedButton(
            child: Icon(Icons.add),
            onPressed: _incrementCounter,
          ),
          RaisedButton(
            child: Icon(Icons.remove),
            onPressed: _decrementCounter,
          ),
        ],
      ),
    );
  }

  void _incrementCounter() {
    print("Incrementando");
    if ( _counter < 5 ) {
      _counter++;
      _events.add(_counter);
    } else {
      _events.addError("Valor maximo ${_counter}");
    }
  }

  void _decrementCounter() {
    print("Decrementando");
    if ( _counter > 0 ) {
      _counter--;
      _events.add(_counter);
    } else {
      _events.addError("Valor minimo ${_counter}");
    }
  }
}
