class User {
  // Lista de preferencias
  static const String PreferenciasHardware = 'hardware';
  static const String PreferenciasDesenvolvimento = 'desenvolvimento';
  static const String PreferenciasRedes = 'redes';
  // Lista de areas de atuacao
  final List <String>Atuacao = ["Desenvolvedor","Gestor","Estudante"];

  // Dados do usuario
  String nome = '';
  int? idade;
  String? estciv;
  String? atuacao;
  Map preferencias = {
    PreferenciasHardware: false,
    PreferenciasDesenvolvimento: false,
    PreferenciasRedes: false
  };
  bool? newsletter = false;

  // Salvando os dados do modelo
  save() {
    print('Salvando os dados');
  }

  // Exibe os dados do modelo
  show() {
    print("Dados do usuario");
    print("  Nome        : ${this.nome}");
    print("  Idade       : ${this.idade}");
    print("  Estado Civil: ${this.estciv}");
    print("  Atuacao     : ${this.atuacao}");
    print("  NewsLetter  : ${this.newsletter!?"Sim":"Nao"}");
    print("  Preferencias:");
    if ( this.preferencias[PreferenciasHardware] )
      print("      Hardware");
    if ( this.preferencias[PreferenciasDesenvolvimento] )
      print("      Desenvolvimento");
    if ( this.preferencias[PreferenciasRedes] )
      print("      Redes");
  }
}
