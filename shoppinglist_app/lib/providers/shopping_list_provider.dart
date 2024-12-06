import 'package:flutter/material.dart';
import '../models/shopping_list.dart';

class ShoppingListProvider with ChangeNotifier {
  List<ShoppingList> _shoppingLists = [];

  List<ShoppingList> get shoppingLists => _shoppingLists;

  void addList(ShoppingList list) {
    _shoppingLists.add(list);
    notifyListeners();
  }

  void updateList(String id, ShoppingList updatedList) {
    final index = _shoppingLists.indexWhere((list) => list.id == id);
    if (index != -1) {
      _shoppingLists[index] = updatedList;
      notifyListeners();
    }
  }

  void deleteList(String id) {
    _shoppingLists.removeWhere((list) => list.id == id);
    notifyListeners();
  }
}
