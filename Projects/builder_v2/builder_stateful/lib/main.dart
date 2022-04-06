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
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    print("Criando Home");
    return Scaffold(
      appBar: AppBar(
        title: Text("SatefulBuilder"),
      ),
      body: Center(
        child: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            print("Recriando StatefulWidget ${_counter}");
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.skip_previous,size: 40.0,),
                  onPressed: () {
                    setState(() => _counter--);
                  },
                ),
                Text(
                  "$_counter",
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                IconButton(
                  icon: Icon(Icons.skip_next,size: 40.0,),
                  onPressed: () {
                    setState(() => _counter++);
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
