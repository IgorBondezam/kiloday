import 'package:flutter/material.dart';
import 'package:kiloday/model/interfaces/list_item.dart';

class ExpandedCardTitleSubtitle extends StatelessWidget {
  ExpandedCardTitleSubtitle(
      {required this.item, this.onDelete, super.key});

  ListItem item;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(item.getTitle()),
        subtitle: Text(item.getSubTitle()),
        trailing: onDelete == null
            ? null
            : IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () async => onDelete!(),
              ),
      ),
    );
  }
}
