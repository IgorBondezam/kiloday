import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kiloday/components/expanded_listagem_title_subtitle.dart';
import 'package:kiloday/main.dart';
import 'package:kiloday/model/alimento.dart';
import 'package:kiloday/service/alimento_service.dart';
import 'package:kiloday/utils/create_object_utils.dart';

class CrudAlimento extends StatefulWidget {
  CrudAlimento({super.key});

  TextEditingController nomeController = TextEditingController();
  TextEditingController caloriasController = TextEditingController();
  TextEditingController proteinasController = TextEditingController();
  TextEditingController quantidadeController = TextEditingController();
  List<Alimento> alimentos = [];

  @override
  State<CrudAlimento> createState() => _CrudAlimentoState();
}

class _CrudAlimentoState extends State<CrudAlimento> {
  AlimentoService service = AlimentoService(http.Client());

  @override
  void initState() {
    getAlimentos();
    super.initState();
  }

  Future<void> getAlimentos() async {
    widget.alimentos = await service.findAll();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
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
        SizedBox(
          width: 250,
          child: TextField(
            controller: widget.caloriasController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'calorias',
            ),
          ),
        ),
        const Padding(padding: EdgeInsets.all(8.0)),
        SizedBox(
          width: 250,
          child: TextField(
            controller: widget.proteinasController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'proteinas',
            ),
          ),
        ),
        const Padding(padding: EdgeInsets.all(8.0)),
        SizedBox(
          width: 250,
          child: TextField(
            controller: widget.quantidadeController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'quantidade',
            ),
          ),
        ),
        const Padding(padding: EdgeInsets.all(16.0)),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: MyApp.green),
          onPressed: () {
            if (!(widget.nomeController.text != '' &&
                widget.caloriasController.text != '' &&
                widget.proteinasController.text != '' &&
                widget.quantidadeController.text != '')) {
              return;
            }
            Alimento alimento = Alimento(
                CreateObjectUtils.createIdRandom().toString(),
                widget.nomeController.text,
                double.parse(widget.caloriasController.text),
                double.parse(widget.proteinasController.text),
                double.parse(widget.quantidadeController.text));
            service.save(alimento.toJson());
            getAlimentos();
          },
          child: const Text(
            'Adicionar',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
        ExpandedListagemTitleSubtitle(listagem: widget.alimentos)
      ],
    );
  }
}
