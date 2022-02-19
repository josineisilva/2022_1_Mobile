void main() {
  String? s;
  if ( s == null )
    print("Nulo");
  s = "Hello World";
  if ( s is String )
    print("String");
}
