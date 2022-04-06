import 'package:flutter/material.dart';

int _counter = 0;

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    print("Counter ${_counter}");
  }

  @override
  void initState() {
    super.initState();
    print("Home initState");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("Home didChangeDependencies");
  }

  @override
  Widget build(BuildContext context) {
    print("Home build");
    return Scaffold(
      appBar: AppBar(
        title: Text("Ciclo de Vida"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Counter(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  @override
  void didUpdateWidget(Home oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("Home didUpdateWidget");
  }

  @override
  void setState(fn) {
    print("Home setState");
    super.setState(fn);
  }

  @override
  void dispose() {
    print("Home dispose");
    super.dispose();
  }
}

class Counter extends StatefulWidget {

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {

  @override
  void initState() {
    super.initState();
    print("Counter initState");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("Counter didChangeDependencies");
  }

  @override
  Widget build(BuildContext context) {
    print("Counter build");
    return Text(
      '$_counter',
      style: Theme.of(context).textTheme.headline4,
    );
  }

  @override
  void didUpdateWidget(Counter oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("Counter didUpdateWidget");
  }

  @override
  void setState(fn) {
    print("Counter setState");
    super.setState(fn);
  }

  @override
  void deactivate() {
    print("Counter deactivate");
    super.deactivate();
  }

  @override
  void dispose() {
    print("Counter dispose");
    super.dispose();
  }
}
