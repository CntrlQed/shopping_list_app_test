import 'package:flutter/material.dart';
import 'package:shoppinglist_app/screens/list_detail_screen.dart';
import '../models/shopping_list.dart';

class ShoppingListTile extends StatelessWidget {
  final ShoppingList list;

  ShoppingListTile({required this.list});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(list.name),
      subtitle: Text(
          '${list.items.length} items, ${list.completionPercentage * 100}% completed'),
      trailing: Icon(Icons.chevron_right),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => ListDetailScreen(), 
          ),
        );
      },
    );
  }
}
