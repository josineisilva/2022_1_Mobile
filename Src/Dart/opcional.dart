import 'dart:math';

int potencia( int base, [int? expoente] ) {
  expoente ??= 2;
  return( pow(base,expoente).toInt() );
}

void main() {
  print("5^3  = ${potencia(5,3)}");
  print("5^2  = ${potencia(5)}");
}
