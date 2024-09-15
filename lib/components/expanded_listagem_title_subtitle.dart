import 'package:flutter/material.dart';
import 'package:kiloday/model/interfaces/list_item.dart';

class ExpandedListagemTitleSubtitle extends StatelessWidget {
  ExpandedListagemTitleSubtitle({required this.listagem, super.key});

  List<ListItem> listagem;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: listagem.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(listagem[index].getTitle()),
              subtitle: Text(listagem[index].getSubTitle()),
            ),
          );
        },
      ),
    );
  }
}
