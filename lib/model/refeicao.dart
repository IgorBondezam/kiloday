import 'package:intl/intl.dart';
import 'package:kiloday/model/alimento.dart';

import 'interfaces/list_item.dart';

class Refeicao extends ListItem {


  String nome;
  DateTime horarioRefeicao;
  List<Alimento> alimentos = [];

  Refeicao(this.nome, this.horarioRefeicao);

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
}