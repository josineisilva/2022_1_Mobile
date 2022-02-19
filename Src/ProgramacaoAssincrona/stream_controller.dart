import 'dart:async';

main() {
  print("Inicio do programa");
  StreamController streamController = StreamController();
  streamController.stream.listen((data) {
      print("DataReceived: " + data);
    },
    onDone: () {
      print("Task Done");
    },
    onError: (error) {
        print("Some Error");
    }
  );
  
  streamController.add("This a test data");
  streamController.addError(new Exception('An exception'));
  streamController.add("This a test data 2");
  streamController.add("This a test data 3");
  streamController.close();
  print("Final do programa");
}
