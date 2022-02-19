void main() {
  Stopwatch sw1 = Stopwatch();
  sw1.start();
  StringBuffer sb = StringBuffer();
  for (int i = 0; i < 10000; i++)
    sb.write("Teste");
  print("Com StringBuffer: "+sw1.elapsedMilliseconds.toString());
  Stopwatch sw2 = Stopwatch();
  sw2.start();
  String s = '';
  for (int i = 0; i < 10000; i++)
    s += "Teste";
  print("Com String: "+sw2.elapsedMilliseconds.toString());
}
