import 'package:flutter/material.dart';
import 'screens/disciplina_screen.dart';
import 'stores/academic_store.dart';
import 'db/database_helper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AcademicStore store = AcademicStore();
  final DatabaseHelper dbHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Academic Report App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DisciplinaScreen(store: store),
    );
  }
}
