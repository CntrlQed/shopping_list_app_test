import 'shopping_item.dart';

class ShoppingList {
  final String id;
  final String name;
  final List<ShoppingItem> items;
  final DateTime createdAt;

  ShoppingList({
    required this.id,
    required this.name,
    required this.items,
    required this.createdAt,
  });

  double get completionPercentage {
    if (items.isEmpty) return 0;
    return items.where((item) => item.isCompleted).length / items.length;
  }
}
