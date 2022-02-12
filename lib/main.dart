import 'package:flutter/material.dart';
import 'package:google_sheet_db/widgets/my_app.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.blue,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Color(0xff0000cc),
      ),
    ),
    home: MyApp(),
  ));
}
