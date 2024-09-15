import 'package:kiloday/model/refeicao.dart';

class User {
  String email;
  String password;

  List<Refeicao> refeicoes = [];

  User(this.email, this.password);

  bool loginValid() {
    return email == "admin" && password == "admin";
  }
}