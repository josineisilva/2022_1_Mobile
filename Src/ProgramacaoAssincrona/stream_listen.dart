import 'dart:io';
import 'dart:async';

main() {
  print("Inicio do programa");
  Stream<String> stream = new Stream.fromFuture(getData());
  StreamSubscription<String> subscription = 
    stream.listen((data) {
        print("DataReceived: "+data);
      },
      onDone: () { print("Task Done"); },
      onError: (error) { print("Some Error"); }
    );
  print("Final do programa");
}

Future<String> getData() async {
  var file = File('/etc/os-release');
  var contents = await file.readAsString();
  print("Fetched Data");
  return contents;
}
