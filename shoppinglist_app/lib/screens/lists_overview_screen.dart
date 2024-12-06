import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/shopping_list_provider.dart';
import '../widgets/shopping_list_tile.dart';
import 'add_edit_list_screen.dart';

class ListsOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final shoppingLists = Provider.of<ShoppingListProvider>(context).shoppingLists;

    return Scaffold(
      appBar: AppBar(title: Text('Shopping Lists')),
      body: shoppingLists.isEmpty
          ? Center(child: Text('No shopping lists yet!'))
          : ListView.builder(
              itemCount: shoppingLists.length,
              itemBuilder: (ctx, i) {
                final list = shoppingLists[i];
                return ShoppingListTile(list: list);
              },
            ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (ctx) => AddEditListScreen()),
          );
        },
      ),
    );
  }
}
