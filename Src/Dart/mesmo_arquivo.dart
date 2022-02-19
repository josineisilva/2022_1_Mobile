class Cor {
  String _valor = "";

  void set cor(String v) { this._valor = v; }
  String get cor { return(_valor); }
}

void main() {
  Cor c = Cor();
  c._valor = "Azul";
  print("Cor ${c.cor}");
}
