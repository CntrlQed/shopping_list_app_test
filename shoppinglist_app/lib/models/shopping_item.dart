enum Priority { low, medium, high }

class ShoppingItem {
  final String id;
  final String name;
  final int quantity;
  final String category;
  final Priority priority;
  bool isCompleted;

  ShoppingItem({
    required this.id,
    required this.name,
    required this.quantity,
    required this.category,
    required this.priority,
    this.isCompleted = false,
  });
}
