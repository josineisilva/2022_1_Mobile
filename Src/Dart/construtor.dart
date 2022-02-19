class Contato {
  String nome;
  String sobrenome;

  Contato(this.nome,this.sobrenome);
}

void main() {
  Contato c = Contato("Ana", "Martins");
  print("Contato ${c.nome} ${c.sobrenome}");
}
