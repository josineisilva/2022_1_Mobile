class Contato {
  String nome = "";
  String sobrenome = "";
  void Show() {
    print("Contato ${this.nome} ${this.sobrenome}");
  }
}

void main() {
  Contato c = Contato();
  c..nome = "Ana"
   ..sobrenome = "Martins"
   ..Show();
}
