import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/shopping_list_provider.dart';
import 'providers/theme_provider.dart';
import 'screens/lists_overview_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ShoppingListProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: ShoppingListApp(),
    ),
  );
}

class ShoppingListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeMode = Provider.of<ThemeProvider>(context).themeMode;

    return MaterialApp(
      title: 'Shopping List App',
      themeMode: themeMode,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: ListsOverviewScreen(),
    );
  }
}
