import 'package:intl/intl.dart';
import 'package:kiloday/model/alimento.dart';

import 'interfaces/list_item.dart';

class Refeicao extends ListItem {

  int id;
  String nome;
  DateTime horarioRefeicao;
  List<Alimento> alimentos = [];

  Refeicao(this.id, this.nome, this.horarioRefeicao);

  String printHorarioEAlimentos() {
    final f = DateFormat('dd-MM-yyyy - HH:mm');
    String valorParaPrint = "";
    valorParaPrint = f.format(horarioRefeicao).toString();
    for (Alimento alimento in alimentos) {
      valorParaPrint += "\n${alimento.toString()}";
    }
    return valorParaPrint;
  }

  void adicionarAlimento(Alimento alimento)  {
    alimentos.add(alimento);
  }

  double totalCalorias() {
    double soma = alimentos.map((a) => a.calorias).reduce((sum, element){
      return sum + element;
    });
    return soma;
  }

  double totalProteinas() {
    double soma = alimentos.map((a) => a.proteinas).reduce((sum, element){
      return sum + element;
    });
    return soma;
  }

  @override
  String getSubTitle() {
    return printHorarioEAlimentos();
  }

  @override
  String getTitle() {
    return nome;
  }

  factory Refeicao.decodeToClass(Map<String, dynamic> json) {
    Refeicao refeicao = Refeicao(int.parse(json['id']), json['nome'], DateTime.parse(json['horarioRefeicao']));

    if (json['alimentos'] != null) {
      json['alimentos'].forEach((a) {
        refeicao.alimentos.add(Alimento.decodeToClass(a));
      });
    }
    return refeicao;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['horarioRefeicao'] = horarioRefeicao;
    data['alimentos'] = alimentos.map((v) => v.toJson()).toList();
    return data;
  }

}