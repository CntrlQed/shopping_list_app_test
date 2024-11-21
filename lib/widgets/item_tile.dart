import 'package:flutter/material.dart';
import '../models/shopping_item.dart';

class ItemTile extends StatelessWidget {
  final ShoppingItem item;
  final VoidCallback onToggleCompletion;
  final VoidCallback onDelete; // Added delete callback

  const ItemTile({
    Key? key,
    required this.item,
    required this.onToggleCompletion,
    required this.onDelete, // Pass delete callback
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: Checkbox(
          value: item.isCompleted,
          onChanged: (value) => onToggleCompletion(),
        ),
        title: Text(
          item.name,
          style: TextStyle(
            decoration: item.isCompleted ? TextDecoration.lineThrough : null,
          ),
        ),
        subtitle: Text('${item.quantity}x - ${item.category}'),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: onDelete, // Call delete callback
        ),
      ),
    );
  }
}
