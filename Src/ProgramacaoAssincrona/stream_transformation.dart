import 'dart:async';

main() async {
  Stream<int> head = createStream(5).take(2);
  print("Head");
  await for(int i in head){ print(i); }
  Stream<int> tail = createStream(5).skip(3);
  print("Tail");
  await for(int i in tail){ print(i); }
  Stream<int> even = createStream(5)
    .where((value) => value%2==0);
  print("Even");
  await for(int i in even){ print(i); }
  StreamTransformer<int,int> doubleTransformer = 
    StreamTransformer.fromHandlers(handleData: handleData);
  Stream<int> dobro = createStream(5)
    .transform(doubleTransformer);
  print("Double");
  await for(int i in dobro){ print(i); }
}

Stream<int> createStream(int max) async* {
  for (int i = 1; i <= max; i++) {
    yield i;
  }
}

void handleData(data, EventSink sink) {
  sink.add(data*2);
}
