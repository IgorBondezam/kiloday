import 'package:kiloday/model/interfaces/dropdown_item.dart';
import 'package:kiloday/model/interfaces/list_item.dart';

class Alimento implements ListItem, DropdownItem {

  String nome;
  double calorias;
  double proteinas;
  double quantidade;

  Alimento(this.nome, this.calorias, this.proteinas, this.quantidade);

  @override
  String toString() {
    return 'Nome: $nome, Calorias: $calorias, Proteínas: $proteinas e quantidade: $quantidade';
  }

  @override
  String getSubTitle() {
    return
        '    Calorias: ${calorias}\n'
        '    Proteínas: ${proteinas}\n'
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

}