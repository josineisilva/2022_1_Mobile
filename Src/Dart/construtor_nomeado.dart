class Cor {
  String valor = "";

  Cor.Vermelho() { valor="vermelho"; }
  Cor.Verde() { valor="verde"; }
  Cor.Azul() { valor="azul"; }
}

void main() {
  print("Cor ${Cor.Vermelho().valor}");
  print("Cor ${Cor.Verde().valor}");
  print("Cor ${Cor.Azul().valor}");
}
