import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'stores/academic_store.dart';
import 'screens/disciplina_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<AcademicStore>(
          create: (_) => AcademicStore(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DisciplinaScreen(), // Remova o parâmetro store
    );
  }
}
