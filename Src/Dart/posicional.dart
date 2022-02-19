import 'dart:math';

int potencia( int base, int expoente ) {
  return( pow(base,expoente).toInt() );
}

void main() {
  print("5^3  = ${potencia(5,3)}");
}
