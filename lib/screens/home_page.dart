import 'package:flutter/material.dart';
import 'shopping_list_page.dart';
import '../utils/constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Shopping Lists'),
        backgroundColor: primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildListTile(
              context,
              title: 'Home',
              subtitle: '32 Products',
              icon: Icons.home,
            ),
            _buildListTile(
              context,
              title: 'Baby',
              subtitle: '7 Products',
              icon: Icons.child_care,
            ),
            _buildListTile(
              context,
              title: 'Medicine',
              subtitle: '4 Products',
              icon: Icons.medical_services,
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
         
      //   },
      //   backgroundColor: accentColor,
      //   child: const Icon(Icons.add),
      // ),
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
        trailing: IconButton(
          icon: const Icon(Icons.more_vert, color: Colors.white),
          onPressed: () {},
        ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const ShoppingListPage()));
        },
      ),
    );
  }
}
