class Comun {
  int count = 0;

  void inc() => count = count + 1;
}

void main() {
  Comun a = Comun();
  Comun b = Comun();
  print("a = ${a.count}");
  print("b = ${b.count}");
  a.inc();
  print("a = ${a.count}");
  print("b = ${b.count}");
}
