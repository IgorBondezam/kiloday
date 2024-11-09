import 'package:flutter/material.dart';
import 'package:kiloday/components/expanded_listagem_remove_item.dart';
import 'package:kiloday/main.dart';
import 'package:kiloday/model/interfaces/dropdown_list_item.dart';

class DropdownMenuListAddItem extends StatefulWidget {
  DropdownMenuListAddItem(
      {required this.items, required this.itemsAdicionados, super.key});

  List<DropdownListItem> items = [];

  List<DropdownMenuItem<DropdownListItem>> get dropdownItems {
    List<DropdownMenuItem<DropdownListItem>> menuItems = [];
    for (var i in items) {
      menuItems.add(
        DropdownMenuItem(value: i, child: Text(i.textoDropdown())),
      );
    }
    return menuItems;
  }

  List<DropdownListItem> itemsAdicionados;

  @override
  State<DropdownMenuListAddItem> createState() =>
      _DropdownMenuListAddItemState();
}

class _DropdownMenuListAddItemState extends State<DropdownMenuListAddItem> {
  DropdownListItem? selecionado;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DropdownButton(
              disabledHint: const Text("Nenhum alimento adicionado"),
              items: widget.dropdownItems,
              value: selecionado,
              onChanged: (DropdownListItem? value) {
                setState(() {
                  selecionado = value;
                });
              },
            ),
            const Padding(padding: EdgeInsets.all(8.0)),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: MyApp.green),
              onPressed: () {
                if (selecionado != null) {
                  setState(() {
                    widget.itemsAdicionados.add(selecionado!);
                  });
                }
              },
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ],
        ),
        SizedBox(
            height: 200,
            width: 500,
            child: Card(
              child: ExpandedListagem_remove_item(
                listagem: widget.itemsAdicionados,
                width: 300,
              ),
            )),
      ],
    );
  }
}
