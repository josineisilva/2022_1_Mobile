void main() {
  String s1 = "Hello World";
  String s2 = "Hello World";
  if ( identical( s1, s2 ) )
    print("As strings sao o mesmo objeto");
  StringBuffer sb1 = StringBuffer("Hello World");
  StringBuffer sb2 = StringBuffer("Hello World");
  if ( identical( sb1, sb2 ) )
    print("Os buffers sao o mesmo objeto");
}
