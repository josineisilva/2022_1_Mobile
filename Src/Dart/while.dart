void main() {
  int i = 1;
  int fat = 1;
  while(i<5) {
    fat *= i;
    print("${i}! = ${fat}");
    i++;
  }
}
