import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kiloday/components/dropdown_menu_add_item.dart';
import 'package:kiloday/components/expanded_listagem_title_subtitle.dart';
import 'package:kiloday/main.dart';
import 'package:kiloday/model/alimento.dart';
import 'package:kiloday/model/refeicao.dart';

class CrudRefeicao extends StatefulWidget {
  CrudRefeicao(this.alimentos, this.refeicoes, {super.key});


  TextEditingController nomeController = TextEditingController();
  TextEditingController dataController = TextEditingController();

  List<Refeicao> refeicoes = [];
  List<Alimento> alimentos = [];
  List<Alimento> alimentosSelecionados = [];

  @override
  State<CrudRefeicao> createState() => _CrudRefeicaoState();
}

class _CrudRefeicaoState extends State<CrudRefeicao> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Padding(padding: EdgeInsets.all(16.0)),
        SizedBox(
          width: 250,
          child: TextField(
            controller: widget.nomeController,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'nome',
            ),
          ),
        ),
        const Padding(padding: EdgeInsets.all(8.0)),
        DropdownMenuListAddItem(items: widget.alimentos, itemsAdicionados: widget.alimentosSelecionados),
        const Padding(padding: EdgeInsets.all(16.0)),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: MyApp.green),
          onPressed: () {
            setState(() {
              Refeicao refeicao = Refeicao(widget.nomeController.text, DateTime.now());
              refeicao.alimentos = widget.alimentosSelecionados;
              widget.refeicoes.add(refeicao);
              widget.alimentosSelecionados = [];
            });
          },
          child: const Text(
            'Adicionar',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
        ExpandedListagemTitleSubtitle(listagem: widget.refeicoes),
      ],
    );
  }
}
