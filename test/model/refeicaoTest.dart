import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:kiloday/model/alimento.dart';
import 'package:kiloday/model/refeicao.dart';

void main() {
  test("Deve retornar o valor da data e hora de cada refeicao", () {
    Alimento picanha = Alimento(1, 'Picanha', 800.5, 54.68, 300);
    Alimento macarrao = Alimento(2, 'Macarrao', 1500.5, 123.68, 500);


    Refeicao refeicao = Refeicao(1, "Janta Domingao", DateTime.parse("2024-01-01 19:00:00"));
    refeicao.alimentos.add(picanha);
    refeicao.alimentos.add(macarrao);

    expect(refeicao.getInformacoesRefeicao(),
      '01-01-2024 - 19:00\nNome: Picanha, Calorias: 800.5, Proteínas: 54.68 e quantidade: 300.0\nNome: Macarrao, Calorias: 1500.5, Proteínas: 123.68 e quantidade: 500.0'
    );
  });

  test("Deve retornar o total de proteinas baseado na quantidade de proteinas de cada alimento", () {
    Alimento picanha = Alimento(1, 'Picanha', 800.5, 54.68, 300);
    Alimento macarrao = Alimento(2, 'Macarrao', 1500.5, 123.68, 500);


    Refeicao refeicao = Refeicao(1, "Janta Domingao", DateTime.parse("2024-01-01 19:00:00"));
    refeicao.alimentos.add(picanha);
    refeicao.alimentos.add(macarrao);

    expect(refeicao.totalProteinas(), 178.36);
  });

  test("Deve retornar o total de proteinas baseado na quantidade de proteinas de cada alimento", () {
    Alimento picanha = Alimento(1, 'Picanha', 800.5, 54.68, 300);
    Alimento macarrao = Alimento(2, 'Macarrao', 1500.5, 123.68, 500);


    Refeicao refeicao = Refeicao(1, "Janta Domingao", DateTime.parse("2024-01-01 19:00:00"));
    refeicao.alimentos.add(picanha);
    refeicao.alimentos.add(macarrao);

    expect(refeicao.totalCalorias(), 2301.0);
  });
}