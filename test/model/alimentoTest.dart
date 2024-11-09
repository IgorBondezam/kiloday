import 'package:flutter_test/flutter_test.dart';
import 'package:kiloday/model/alimento.dart';

void main() {
  test("Validando o retorno do toString do alimento", () {
    Alimento alimento = Alimento("1", 'Picanha', 800.5, 54.68, 300);
    expect(alimento.toString(), "Alimento: Picanha, Calorias: 800.5 Kcal, Proteínas: 54.68 gramas e quantidade: 300.0 gramas");
  });

  test("Validar valor do subtitulo que será apresentado por cada alimento", () {
    Alimento alimento = Alimento("1", 'Picanha', 800.5, 54.68, 300);
    expect(alimento.getSubTitle(),
        '    Calorias: 800.5 Kcal\n'
            '    Proteínas: 54.68 gramas\n'
            '    Quantidade: 300.0 gramas');
  });
}