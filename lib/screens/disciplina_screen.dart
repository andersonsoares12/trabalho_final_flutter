import 'package:flutter/material.dart';
import '../models/disciplina.dart';
import '../stores/academic_store.dart';

class DisciplinaScreen extends StatelessWidget {
  final AcademicStore store;

  DisciplinaScreen({required this.store});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Disciplinas')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: store.disciplinas.length,
              itemBuilder: (context, index) {
                final disciplina = store.disciplinas[index];
                return ListTile(
                  title: Text(disciplina.nome),
                  subtitle: Text(disciplina.isAnual ? 'Anual' : 'Semestral'),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Navegue para uma tela para adicionar nova disciplina
            },
            child: Text('Adicionar Disciplina'),
          ),
        ],
      ),
    );
  }
}
