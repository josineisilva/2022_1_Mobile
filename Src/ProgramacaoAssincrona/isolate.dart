import 'dart:io';
import 'dart:async';
import 'dart:isolate';

void main() async {
  stdout.writeln('spawning isolate...');
  ReceivePort receivePort = ReceivePort(); //port for this main isolate to receive messages.
  Isolate isolate = await Isolate.spawn(runTimer, receivePort.sendPort);
  stdout.writeln('listening...');
  await start(receivePort);
  stdout.writeln('press enter key to quit...');
  await stdin.first;
  stop(isolate);
  stdout.writeln('goodbye!');
  exit(0);
}

Future start(ReceivePort receivePort) async {
  receivePort.listen((data) {
    stdout.writeln('RECEIVE: ' + data);
  });
}

void runTimer(SendPort sendPort) {
  int counter = 0;
  Timer.periodic(new Duration(seconds: 1), (Timer t) {
    counter++;
    String msg = 'notification ' + counter.toString();  
    stdout.writeln('SEND: ' + msg);  
    sendPort.send(msg);
  });
}

void stop(Isolate isolate) {  
  stdout.writeln('killing isolate');
  isolate.kill(priority: Isolate.immediate);
}
