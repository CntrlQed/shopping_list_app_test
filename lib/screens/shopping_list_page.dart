import 'package:flutter/material.dart';
import '../widgets/item_tile.dart';
import '../models/shopping_item.dart';

class ShoppingListPage extends StatefulWidget {
  const ShoppingListPage({Key? key}) : super(key: key);

  @override
  State<ShoppingListPage> createState() => _ShoppingListPageState();
}

class _ShoppingListPageState extends State<ShoppingListPage> {
  final List<ShoppingItem> items = [
    ShoppingItem(name: 'Milk', quantity: 2, category: 'Groceries', priority: Priority.high),
    ShoppingItem(name: 'Avocado', quantity: 4, category: 'Groceries', priority: Priority.medium),
    ShoppingItem(name: 'Cheese', quantity: 1, category: 'Groceries', priority: Priority.low),
  ];

  void toggleCompletion(int index) {
    setState(() {
      items[index].isCompleted = !items[index].isCompleted;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grocery Store'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ItemTile(
            item: items[index],
            onToggleCompletion: () => toggleCompletion(index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to add item form
        },
        backgroundColor: Colors.orange,
        child: const Icon(Icons.add),
      ),
    );
  }
}
