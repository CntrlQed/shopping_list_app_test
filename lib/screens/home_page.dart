import 'package:flutter/material.dart';
import 'shopping_list_page.dart';
import '../utils/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> _categories = [
    {'title': 'Home', 'subtitle': '3 Products', 'icon': Icons.home},
    {'title': 'Baby', 'subtitle': '7 Products', 'icon': Icons.child_care},
    {'title': 'Medicine', 'subtitle': '4 Products', 'icon': Icons.medical_services},
  ];

  void _addCategory(String title, String subtitle, IconData icon) {
    setState(() {
      _categories.add({'title': title, 'subtitle': subtitle, 'icon': icon});
    });
  }

  void _deleteCategory(String title) {
    setState(() {
      _categories.removeWhere((category) => category['title'] == title);
    });
  }

  void _showDeleteConfirmation(BuildContext context, String title) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Category'),
          content: Text('Are you sure you want to delete the "$title" category?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                _deleteCategory(title);
                Navigator.pop(context); // Close the dialog
              },
              child: const Text('Delete', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  void _showAddCategoryModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            top: 16,
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16,
          ),
          child: AddCategoryModal(onSave: _addCategory),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Shopping Lists'),
        backgroundColor: primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: _categories.length,
          itemBuilder: (context, index) {
            final category = _categories[index];
            return _buildListTile(
              context,
              title: category['title'],
              subtitle: category['subtitle'],
              icon: category['icon'],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddCategoryModal,
        backgroundColor: accentColor,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildListTile(BuildContext context, {required String title, required String subtitle, required IconData icon}) {
    return Card(
      color: primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: Icon(icon, color: Colors.white),
        title: Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle, style: const TextStyle(color: Colors.white)),
        trailing: PopupMenuButton<String>(
          icon: const Icon(Icons.more_vert, color: Colors.white),
          onSelected: (String value) {
            if (value == 'delete') {
              _showDeleteConfirmation(context, title);
            }
          },
          itemBuilder: (BuildContext context) {
            return [
              const PopupMenuItem<String>(
                value: 'delete',
                child: Text('Delete'),
              ),
            ];
          },
        ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const ShoppingListPage()));
        },
      ),
    );
  }
}

class AddCategoryModal extends StatefulWidget {
  final Function(String title, String subtitle, IconData icon) onSave;

  const AddCategoryModal({Key? key, required this.onSave}) : super(key: key);

  @override
  State<AddCategoryModal> createState() => _AddCategoryModalState();
}

class _AddCategoryModalState extends State<AddCategoryModal> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _subtitleController = TextEditingController();
  IconData _selectedIcon = Icons.home;

  void _saveCategory() {
    final title = _titleController.text.trim();
    final subtitle = _subtitleController.text.trim();

    if (title.isNotEmpty && subtitle.isNotEmpty) {
      widget.onSave(title, subtitle, _selectedIcon);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Add New Category',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        TextField(
          controller: _titleController,
          decoration: const InputDecoration(
            labelText: 'Category Name',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 16),
        TextField(
          controller: _subtitleController,
          decoration: const InputDecoration(
            labelText: 'Subtitle (e.g., Number of Products)',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 16),
        DropdownButtonFormField<IconData>(
          value: _selectedIcon,
          items: const [
            DropdownMenuItem(value: Icons.home, child: Text('Home')),
            DropdownMenuItem(value: Icons.child_care, child: Text('Baby')),
            DropdownMenuItem(value: Icons.medical_services, child: Text('Medicine')),
            DropdownMenuItem(value: Icons.shopping_cart, child: Text('Groceries')),
          ],
          onChanged: (icon) {
            setState(() {
              _selectedIcon = icon!;
            });
          },
          decoration: const InputDecoration(
            labelText: 'Select Icon',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: _saveCategory,
          style: ElevatedButton.styleFrom(
            backgroundColor: accentColor,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          child: const Text('Save', style: TextStyle(fontSize: 16)),
        ),
      ],
    );
  }
}
