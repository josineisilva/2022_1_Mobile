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
  List<String> flags = [
    "assets/images/alemanha.jpg",
    "assets/images/argentina.jpg",
    "assets/images/australia.jpg",
    "assets/images/brasil.jpg",
    "assets/images/canada.jpg",
    "assets/images/chile.jpg",
    "assets/images/coreiadosul.jpg",
    "assets/images/dinamarca.jpg",
    "assets/images/espanha.jpg",
    "assets/images/estadosunidos.jpg",
    "assets/images/franca.jpg",
    "assets/images/gra-bretanha.jpg",
    "assets/images/grecia.jpg",
    "assets/images/holanda.jpg",
    "assets/images/italia.jpg",
    "assets/images/japao.jpg",
    "assets/images/mexico.jpg",
    "assets/images/noruega.jpg",
    "assets/images/portugal.jpg",
    "assets/images/uruguai.jpg",
  ];

  @override
  Widget build (BuildContext ctxt) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GridViewBuilder"),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: flags.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
          itemBuilder: (BuildContext context, int index){
            return Image.asset(flags[index]);
          },
        )
      ),
    );
  }
}
