import 'package:flutter/material.dart';

class ListDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List Details')),
      body: Center(child: Text('Details of the shopping list')),
    );
  }
}
