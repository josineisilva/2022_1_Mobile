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

  // Construtor default
  User();

  // Construtor baseado em json
  User.fromJson(Map<String, dynamic> json) {
    List<String> preferencias = json['preferencias'];
    this.nome = json['nome'];
    this.idade = json['idade'];
    this.estciv = json['estciv'];
    this.atuacao = json['atuacao'];
    this.newsletter = json['newsletter'];
    if ( preferencias.contains("Hardware") )
      this.preferencias[PreferenciasHardware] = true;
    if ( preferencias.contains("Desenvolvimento") )
      this.preferencias[PreferenciasDesenvolvimento] = true;
    if ( preferencias.contains("Redes") )
      this.preferencias[PreferenciasRedes] = true;
  }

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

  // Gera o json correspondente ao modelo
  Map<String, dynamic> toJson() {
    Map<String, dynamic> ret = Map<String, dynamic>();
    ret['nome'] = this.nome;
    ret['idade'] = this.idade;
    ret['estciv'] = this.estciv;
    ret['atuacao'] = this.atuacao;
    ret['newsletter'] = this.newsletter;
    List <String>preferencias = <String>[];
    if ( this.preferencias[PreferenciasHardware] )
      preferencias.add('Hardware');
    if ( this.preferencias[PreferenciasDesenvolvimento] )
      preferencias.add('Desenvolvimento');
    if ( this.preferencias[PreferenciasRedes] )
      preferencias.add('Redes');
    ret['preferencias'] = preferencias;
    return(ret);
  }
}
