class Contato {
  String nome;
  String sobrenome;

  Contato(this.nome,this.sobrenome);
}

class Email extends Contato {
  String email = "";

  Email(String n,String s,String v) : super(n,s) {
    this.email = v;
  }
}

void main() {
  Email e = Email("Ana", "Martins","ana@email.com");
  print("Contato ${e.nome} ${e.sobrenome}, ${e.email}");
}
