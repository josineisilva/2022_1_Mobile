import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: <String, WidgetBuilder>{
      '/': (context) => HomePage(),
      '/route': (context) => Route(),
    },
  ));
}

//
// Classe para passar os argumentos
//
class Arguments {
  final String title;
  final String message;

  Arguments(this.title, this.message);
}

//
// Tela principal da aplicacao
//
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Arguments args = Arguments(
              'Extract Arguments Screen',
              'This message is extracted in the build method.',
            );
            Navigator.pushNamed(context, '/route', arguments: args);
          },
          child: Text('Route'),
        ),
      ),
    );
  }
}

class Route extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Extraindo os parametros
    final Arguments args = ModalRoute.of(context)!.settings.arguments as Arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
      ),
      body: Center(
        child: Text(args.message),
      ),
    );
  }
}