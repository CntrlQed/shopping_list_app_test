import 'package:flutter/material.dart';
import 'screens/home_page.dart';
import 'utils/constants.dart';

void main() {
  runApp(const ShoppingListApp());
}

class ShoppingListApp extends StatelessWidget {
  const ShoppingListApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopping List',
      theme: ThemeData(
        primaryColor: primaryColor,
        hintColor: accentColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.green,
          accentColor: accentColor,
        ).copyWith(
          background: backgroundColor,
          brightness: Brightness.light,
        ),
      ),
      home: const HomePage(),
    );
  }
}
