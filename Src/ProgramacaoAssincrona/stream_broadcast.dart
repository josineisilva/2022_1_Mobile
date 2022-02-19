import 'dart:async';

main() async {
  Duration interval = Duration(seconds: 2);
  Stream<int> stream = Stream<int>.periodic(interval, callback)
    .asBroadcastStream();
  stream.listen((data) {
    print("Data: ${data}");
  });
  stream.listen((data) {
    if (data%2==0)
      print("Even");
    else
      print("Odd");
  });
  stream.listen((data) {
    print("Double: ${data*2}");
    print('');
  });
}

int callback(int value) => value;
