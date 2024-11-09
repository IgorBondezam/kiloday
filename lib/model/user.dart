import 'package:kiloday/model/refeicao.dart';

class User {
  String id;
  String email;
  String password;

  List<Refeicao> refeicoes = [];

  User(this.id, this.email, this.password);

  bool loginValid() {
    return email == "admin" && password == "admin";
  }

  factory User.decodeToClass(Map<String, dynamic> json) {
    User user = User(json['id'], json['email'], json['password']);

    if (json['refeicoes'] != null) {
      json['refeicoes'].forEach((r) {
        user.refeicoes.add(Refeicao.decodeToClass(r));
      });
    }
    return user;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['email'] = this.email;
    data['password'] = this.password;
    data['refeicoes'] = this.refeicoes.map((r) => r.toJson()).toList();
    return data;
  }

  double getTotalCaloriasByRefeicoes() {
    double soma =
        refeicoes.map((r) => r.totalCalorias()).reduce((sum, element) {
      return sum + element;
    });
    return soma;
  }

  double getTotalProteinasByRefeicoes() {
    double soma =
        refeicoes.map((r) => r.totalProteinas()).reduce((sum, element) {
      return sum + element;
    });
    return soma;
  }
}
