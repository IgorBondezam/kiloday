import 'package:flutter/material.dart';
import 'package:kiloday/model/interfaces/list_item.dart';

class ExpandedListagem_remove_item extends StatefulWidget {
  ExpandedListagem_remove_item({required this.listagem, this.heigth=50, this.width=100, super.key});

  List<ListItem> listagem = [];

  double heigth;
  double width;

  @override
  State<ExpandedListagem_remove_item> createState() =>
      _ExpandedListagem_remove_itemState();
}

class _ExpandedListagem_remove_itemState
    extends State<ExpandedListagem_remove_item> {
  @override
  Widget build(BuildContext context) {
    return widget.listagem.isEmpty
        ? const Text(
            'Nenhum alimento adicionado.',
            style: TextStyle(fontSize: 18, color: Colors.grey),
          )
        : ListView.builder(
            itemCount: widget.listagem.length,
            itemBuilder: (context, index) {
              return Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: widget.heigth,
                      width: widget.width,
                      child: ListTile(
                        title: Text(widget.listagem[index].getTitle()),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.remove_circle),
                      color: Colors.red,
                      onPressed: () {
                        setState(() {
                          widget.listagem.remove(widget.listagem[index]);
                        });
                      },
                    ),
                  ],
                ),
              );
            },
          );
  }
}
