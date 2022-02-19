void main() {
  dynamic x = 'teste';
  if ( x is String )
    print("String");
  x = 1;
  if ( x is int )
    print("Inteiro");
}
