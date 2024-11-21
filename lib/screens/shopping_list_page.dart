import 'package:flutter/material.dart';
import 'package:shopping_list_app/screens/add_item.dart';
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
    ShoppingItem(name: 'Honey', quantity: 1, category: 'Groceries', priority: Priority.low),
    ShoppingItem(name: 'Dettol', quantity: 1, category: 'Medicine', priority: Priority.high),
  ];

  void toggleCompletion(int index) {
    setState(() {
      items[index].isCompleted = !items[index].isCompleted;
    });
  }

  void deleteItem(int index) {
    setState(() {
      items.removeAt(index);
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
            onDelete: () => deleteItem(index), // Pass the delete function
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newItem = await Navigator.push<ShoppingItem>(
            context,
            MaterialPageRoute(
              builder: (context) => AddItem(
                onItemAdded: (item) {
                  setState(() {
                    items.add(item);
                  });
                },
              ),
            ),
          );

          if (newItem != null) {
            setState(() {
              items.add(newItem);
            });
          }
        },
        backgroundColor: Color.fromARGB(167, 7, 109, 12),
        child: const Icon(Icons.add),
      ),
    );
  }
}
