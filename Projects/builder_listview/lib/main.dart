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

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> litems = [];
  final TextEditingController eCtrl = TextEditingController();
  @override
  Widget build (BuildContext ctxt) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListViewBuilder"),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            style: Theme.of(context).textTheme.displayMedium,
            controller: eCtrl,
            onSubmitted: (text) {
              litems.add(text);
              eCtrl.clear();
              setState(() {});
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: litems.length,
              itemBuilder: (BuildContext ctxt, int Index) {
                print("Item[${Index}] = ${litems[Index]}");
                return Text(litems[Index],
                  style: Theme.of(context).textTheme.displayMedium,
                );
              }
            )
          )
        ],
      )
    );
  }
}
