class MySingleton {
  static final MySingleton _singleton = MySingleton._internal();
  int count = 0;

  factory MySingleton() => _singleton;

  MySingleton._internal() {
   count = 0;
  }

  void inc() => count = count + 1;
}

void main() {
  MySingleton a = MySingleton();
  MySingleton b = MySingleton();
  print("a = ${a.count}");
  print("b = ${b.count}");
  a.inc();
  print("a = ${a.count}");
  print("b = ${b.count}");
}
