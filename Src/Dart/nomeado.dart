import 'dart:math';

int potencia( {int? base, int? expoente} ) {
  base ??= 4;
  expoente ??= 2;
  return( pow(base,expoente).toInt() );
}

void main() {
  print("5^3  = ${potencia(expoente:3,base:5)}");
  print("5^2  = ${potencia(base:5)}");
  print("4^3  = ${potencia(expoente:3)}");
  print("4^2  = ${potencia()}");
}
