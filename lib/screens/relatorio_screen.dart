import 'package:flutter/material.dart';
import '../stores/academic_store.dart';

class RelatorioScreen extends StatelessWidget {
  final AcademicStore store;

  const RelatorioScreen({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Relatórios')),
      body: ListView.builder(
        itemCount: store.disciplinas.length,
        itemBuilder: (context, index) {
          final disciplina = store.disciplinas[index];
          final media = store.calcularMedia(disciplina);
          final aprovado = store.verificarAprovacao(disciplina);
          return ListTile(
            title: Text(disciplina.nome),
            subtitle: Text(
                'Média: ${media.toStringAsFixed(2)} - ${aprovado ? 'Aprovado' : 'Reprovado'}'),
          );
        },
      ),
    );
  }
}
