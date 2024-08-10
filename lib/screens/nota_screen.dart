import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../stores/academic_store.dart';
import '../models/nota.dart';

class NotaScreen extends StatelessWidget {
  final int disciplinaId;

  const NotaScreen({
    super.key,
    required this.disciplinaId,
    required AcademicStore store,
  });

  @override
  Widget build(BuildContext context) {
    final store =
        Provider.of<AcademicStore>(context); // Obtenha o store do context

    final TextEditingController bimestreController = TextEditingController();
    final TextEditingController valorController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Adicionar Nota')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: bimestreController,
              decoration: const InputDecoration(labelText: 'Bimestre'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: valorController,
              decoration: const InputDecoration(labelText: 'Valor'),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            const SizedBox(
              height: 40,
              child: Text(
                'Observação: Para obter a media deve se adicionar no minímo duas notas de bimestres',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 12,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final bimestre = int.tryParse(bimestreController.text) ?? 0;
                final valor = double.tryParse(valorController.text) ?? 0.0;
                if (bimestre > 0 && valor > 0) {
                  final nota = Nota(
                    id: DateTime.now().millisecondsSinceEpoch,
                    disciplinaId: disciplinaId,
                    bimestre: bimestre,
                    valor: valor,
                  );
                  store.addNota(disciplinaId,
                      nota); // Adiciona a nota à disciplina correta

                  Navigator.pop(context); // Voltar para a tela anterior
                }
              },
              child: const Text('Adicionar Nota'),
            ),
          ],
        ),
      ),
    );
  }
}
