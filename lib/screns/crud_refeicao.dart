import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kiloday/components/dropdown_menu_add_item.dart';
import 'package:kiloday/components/expanded_listagem_title_subtitle.dart';
import 'package:kiloday/main.dart';
import 'package:kiloday/model/alimento.dart';
import 'package:kiloday/model/refeicao.dart';
import 'package:kiloday/service/alimento_service.dart';
import 'package:kiloday/service/refeicao_service.dart';
import 'package:kiloday/service/user_service.dart';
import 'package:kiloday/utils/create_object_utils.dart';

import '../model/user.dart';

class CrudRefeicao extends StatefulWidget {
  CrudRefeicao(this.user, {super.key});

  TextEditingController idController = TextEditingController();
  TextEditingController nomeController = TextEditingController();
  TextEditingController dataController = TextEditingController();

  User user;
  List<Refeicao> refeicoes = [];
  List<Alimento> alimentos = [];
  List<Alimento> alimentosSelecionados = [];

  @override
  State<CrudRefeicao> createState() => _CrudRefeicaoState();
}

class _CrudRefeicaoState extends State<CrudRefeicao> {
  RefeicaoService service = RefeicaoService(http.Client());
  UserService userService = UserService(http.Client());
  AlimentoService alimentoService = AlimentoService(http.Client());

  @override
  void initState() {
    getRefeicoes();
    getAlimentos();
    super.initState();
  }

  void getRefeicoes() async {
    widget.refeicoes = await service.findAll();
    setState(() {});
  }

  void getAlimentos() async {
    widget.alimentos = await alimentoService.findAll();
    setState(() {});
  }

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
        DropdownMenuListAddItem(
          itemsAdicionados: widget.alimentosSelecionados,
          items: widget.alimentos,
        ),
        const Padding(padding: EdgeInsets.all(16.0)),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: MyApp.green),
          onPressed: () {
            if (!(widget.nomeController.text != "" &&
                widget.alimentosSelecionados.length > 0)) {
              return;
            }
            Refeicao refeicao = Refeicao(
                CreateObjectUtils.createIdRandom().toString(),
                widget.nomeController.text,
                DateTime.now());
            service.adicionarAlimentoNaRefeicao(
                refeicao, widget.alimentosSelecionados);
            service.save(refeicao.toJson());
            widget.user.refeicoes.add(refeicao);
            userService.save(widget.user.toJson());
            widget.alimentosSelecionados = [];
            getRefeicoes();
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
