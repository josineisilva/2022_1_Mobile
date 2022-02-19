void main() {
  int? x = 3;
  int? y;
  x ??= 4;
  y ??= 4;
  print("x = ${x}");
  print("y = ${y}");
}
