main() async {
  Stream<int> stream = createStream(5);
  await for(int i in stream){
    print("Recebendo o valor ${i}");
    print(i);
  }
}

Stream<int> createStream(int max) async* {
  for (int i = 1; i <= max; i++) {
    await Future.delayed(const Duration(seconds: 2));
    print("Gerando o valor ${i}");
    yield i;
  }
}
