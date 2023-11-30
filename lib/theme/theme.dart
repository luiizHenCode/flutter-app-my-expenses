import 'package:flutter/material.dart';

var themeData = ThemeData(
  primaryColor: Colors.deepPurple,
  bottomSheetTheme: const BottomSheetThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(12),
      ),
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.deepPurple,
    elevation: 0,
  ),
  appBarTheme: const AppBarTheme(
      elevation: 0,
      titleSpacing: 0,
      titleTextStyle: TextStyle(
        fontSize: 18,
        fontFamily: 'Quicksand',
        fontWeight: FontWeight.bold,
      )),
);
