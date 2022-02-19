abstract class Mamifero {
  int vidas = 1;
  String especie = "mamifero";

  Mamifero([String? especie]) {
    if ( especie != null )
      this.especie = especie;
  }

  void quantasVidas() {
    print("Um ${especie} tem ${vidas} vidas");
  }
  void falar();
}

class Gato implements Mamifero {
  int vidas = 7;
  String especie ="";

  void quantasVidas() {
    print("Um gato tem ${vidas} vidas");
  }
  void falar() {
    print("Ronronando");
  }
}

class Cao extends Mamifero {
  Cao() : super("cao") {}

  void falar() {
    print("Latindo");
  }
}

main() {
  Gato g = Gato();
  Cao c = Cao();
  g.quantasVidas();
  g.falar();
  c.quantasVidas();
  c.falar();
}
