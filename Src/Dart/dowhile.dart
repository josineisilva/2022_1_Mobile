void main() {
  int i = 1;
  int fat = 1;
  do {
    fat *= i;
    print("${i}! = ${fat}");
    i++;
  } while(i<5);
}
