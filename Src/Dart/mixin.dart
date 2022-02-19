mixin Mamifero {
  String especie ="mamifero";
  int vidas = 1;

  void Make(String e) {
    especie = e;
  }

  void setVidas(int v) {
    vidas = v;
  }

  void quantasVidas() {
    print("Um ${especie} tem ${vidas} vidas");
  }
}

mixin Som {
  String fala ="nao fala";

  void Make(String s) {
    fala = s;
  }

  void falar() {
    print("${fala}");
  }
}

class Gato with Som,Mamifero {
  Gato() {
    Make("Gato");
    setVidas(7);
  }
}

class Cao with Mamifero,Som {
  Cao() {
    Make("latindo");
  }
}

main() {
  Gato g = Gato();
  g.quantasVidas();
  g.falar();
  Cao c = Cao();
  c.quantasVidas();
  c.falar();
}
