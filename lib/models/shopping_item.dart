class ShoppingItem {
  final String name;
  final int quantity;
  final String category;
  final Priority priority;
  bool isCompleted;

  ShoppingItem({
    required this.name,
    required this.quantity,
    required this.category,
    required this.priority,
    this.isCompleted = false,
  });
}

enum Priority { high, medium, low }
