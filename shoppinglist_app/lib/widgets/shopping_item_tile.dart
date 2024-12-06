import 'package:flutter/material.dart';
import '../models/shopping_item.dart';

class ShoppingItemTile extends StatelessWidget {
  final ShoppingItem item;
  final VoidCallback onToggleComplete;
  final VoidCallback onDelete;

  ShoppingItemTile({
    required this.item,
    required this.onToggleComplete,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: item.isCompleted,
        onChanged: (_) => onToggleComplete(),
      ),
      title: Text(
        item.name,
        style: TextStyle(
          decoration: item.isCompleted ? TextDecoration.lineThrough : null,
        ),
      ),
      subtitle: Text(
        'Quantity: ${item.quantity}, Category: ${item.category}',
        style: TextStyle(
          color: Colors.grey[600],
        ),
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete, color: Colors.red),
        onPressed: onDelete,
      ),
    );
  }
}
