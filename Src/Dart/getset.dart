class Cor {
  String valor = "";

  void set cor(String v) { this.valor = v; }
  String get cor { return(valor); }
}

void main() {
  Cor c = Cor();
  c.cor = "Azul";
  print("Cor ${c.cor}");
}
