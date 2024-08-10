import 'package:flutter/material.dart';
import '../models/disciplina.dart';

class DisciplinaTile extends StatelessWidget {
  final Disciplina disciplina;

  const DisciplinaTile({super.key, required this.disciplina});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(disciplina.nome),
      subtitle: Text(disciplina.isAnual ? 'Anual' : 'Semestral'),
    );
  }
}
