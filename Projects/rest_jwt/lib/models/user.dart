//
// Modelo para dados do usuario
//
class User {
  int? id;
  String? name;
  String? email;
  String? password;
  String? confirm;

  // Construtor padrao
  User({this.id, this.name, this.email, this.password, this.confirm});

  // Construtor de um usuario vazio
  User.empty() {
    id = 0;
    name = "";
    email = "";
    password = "";
    confirm = "";
  }

  // Construtor baseando em JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email']
    );
  }

  // Converte um usuario para JSON
  Map<String, dynamic> toJson() {
    var map = {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'confirm': confirm
    };
    return map;
  }
}
