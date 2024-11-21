import 'package:flutter/material.dart';
import '../models/shopping_item.dart';

class ItemTile extends StatelessWidget {
  final ShoppingItem item;
  final VoidCallback onToggleCompletion;

  const ItemTile({
    Key? key,
    required this.item,
    required this.onToggleCompletion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(
          item.isCompleted ? Icons.check_box : Icons.check_box_outline_blank,
          color: Colors.green,
        ),
        title: Text(item.name),
        subtitle: Text('${item.quantity} x ${item.category}'),
        trailing: Text(
          item.priority.name.toUpperCase(),
          style: TextStyle(
            color: item.priority == Priority.high
                ? Colors.red
                : item.priority == Priority.medium
                    ? Colors.orange
                    : Colors.green,
          ),
        ),
        onTap: onToggleCompletion,
      ),
    );
  }
}
