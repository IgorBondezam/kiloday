import 'package:kiloday/model/interfaces/dropdown_list_item.dart';

class Alimento implements DropdownListItem {
  int id;
  String nome;
  double calorias;
  double proteinas;
  double quantidade;

  Alimento(this.id, this.nome, this.calorias, this.proteinas, this.quantidade);

  @override
  String toString() {
    return 'Alimento: $nome, Calorias: $calorias Kcal , Proteínas: $proteinas gramas  e quantidade: $quantidade gramas';
  }

  @override
  String getSubTitle() {
    return
        '    Calorias: ${calorias} Kcal\n '
        '    Proteínas: ${proteinas} gramas\n '
        '    Quantidade: ${quantidade} gramas';
  }

  @override
  String getTitle() {
    return nome;
  }

  @override
  String textoDropdown() {
    return nome;
  }

  factory Alimento.decodeToClass(Map<String, dynamic> map) {
    return Alimento(int.parse(map['id']), map['nome'], map['calorias'],
        map['proteinas'], map['quantidade']);
  }

  Map<String, dynamic> toJson() =>
      {
        'id': id.toString(),
        'nome': nome,
        'calorias': calorias,
        'proteinas': proteinas,
        'quantidade': quantidade,
      };
}