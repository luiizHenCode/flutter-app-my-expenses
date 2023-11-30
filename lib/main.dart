import 'package:flutter/material.dart';

import './pages/home_page.dart';
import './theme/theme.dart';

void main() {
  runApp(const ExpensesApp());
}

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expenses',
      theme: themeData,
      home: const HomePage(),
    );
  }
}
