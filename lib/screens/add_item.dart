import 'package:flutter/material.dart';
import '../models/shopping_item.dart';
import '../utils/constants.dart';

class AddItem extends StatefulWidget {
  final Function(ShoppingItem) onItemAdded;

  const AddItem({Key? key, required this.onItemAdded}) : super(key: key);

  @override
  State<AddItem> createState() => _AddItemFormState();
}

class _AddItemFormState extends State<AddItem> {
  final _formKey = GlobalKey<FormState>();

  String _itemName = '';
  int _quantity = 1;
  String _category = categories.first;
  Priority _priority = Priority.low;

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();

      // Create a new shopping item
      final newItem = ShoppingItem(
        name: _itemName,
        quantity: _quantity,
        category: _category,
        priority: _priority,
      );

      // Call the callback to add the item to the list
      widget.onItemAdded(newItem);

      // Navigate back
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Item'),
        backgroundColor: primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Item Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name for the item';
                  }
                  return null;
                },
                onSaved: (value) {
                  _itemName = value ?? '';
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Quantity'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || int.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  if (int.parse(value) <= 0) {
                    return 'Quantity must be greater than 0';
                  }
                  return null;
                },
                onSaved: (value) {
                  _quantity = int.parse(value ?? '1');
                },
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Category'),
                value: _category,
                items: categories.map((category) {
                  return DropdownMenuItem(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _category = value ?? categories.first;
                  });
                },
                onSaved: (value) {
                  _category = value ?? categories.first;
                },
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<Priority>(
                decoration: const InputDecoration(labelText: 'Priority'),
                value: _priority,
                items: Priority.values.map((priority) {
                  return DropdownMenuItem(
                    value: priority,
                    child: Text(priority.name.toUpperCase()),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _priority = value ?? Priority.low;
                  });
                },
                onSaved: (value) {
                  _priority = value ?? Priority.low;
                },
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: accentColor,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Add Item',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
