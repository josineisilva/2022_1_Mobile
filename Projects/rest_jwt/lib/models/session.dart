//
// Modelo para dados da sessao
//
class Session {
  String? email;
  String? password;

  // Construtor padrao
  Session({this.email, this.password});

  // Construtor de uma sessao vazia
  Session.empty() {
    email = "";
    password = "";
  }

  // Construtor baseando em JSON
  factory Session.fromJson(Map<String, dynamic> json) {
    return Session(
      email: json['email'],
      password: json['password']
    );
  }

  // Converte uma sessao para JSON
  Map<String, dynamic> toJson() {
    var map = {
      'email': email,
      'password': password
    };
    return map;
  }
}