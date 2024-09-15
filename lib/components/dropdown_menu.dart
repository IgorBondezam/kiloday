import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kiloday/model/interfaces/dropdown_item.dart';

class DropdownMenuList extends StatefulWidget {
  DropdownMenuList(
      {required this.items, required this.itemsAdicionados, super.key});

  List<DropdownItem> items = [];
  List<DropdownItem> itemsAdicionados;

  @override
  State<DropdownMenuList> createState() => _DropdownMenuListState();
}

class _DropdownMenuListState extends State<DropdownMenuList> {
  @override
  Widget build(BuildContext context) {
    DropdownItem selecionado = widget.items.first;
    return Row(
      children: [
        DropdownMenu<DropdownItem>(
          initialSelection: widget.items.first,
          onSelected: (DropdownItem? value) {
            selecionado = value!;
          },
          dropdownMenuEntries: widget.items
              .map<DropdownMenuEntry<DropdownItem>>((DropdownItem value) {
            return DropdownMenuEntry<DropdownItem>(
                value: value, label: value.textoDropdown());
          }).toList(),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.lightGreen),
          onPressed: () {
            setState(() {
              widget.itemsAdicionados.add(selecionado);
            });
          },
          child: const Icon(Icons.add),
        ),
      ],
    );
  }
}
