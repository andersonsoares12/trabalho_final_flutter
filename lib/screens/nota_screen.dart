import 'package:flutter/material.dart';
import '../models/nota.dart';
import '../stores/academic_store.dart';

class NotaScreen extends StatelessWidget {
  final AcademicStore store;
  final int disciplinaId;

  NotaScreen({required this.store, required this.disciplinaId});

  @override
  Widget build(BuildContext context) {
    final TextEditingController bimestreController = TextEditingController();
    final TextEditingController valorController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text('Lançar Notas')),
      body: Column(
        children: [
          TextField(
            controller: bimestreController,
            decoration: InputDecoration(labelText: 'Bimestre'),
            keyboardType: TextInputType.number,
          ),
          TextField(
            controller: valorController,
            decoration: InputDecoration(labelText: 'Valor'),
            keyboardType: TextInputType.numberWithOptions(decimal: true),
          ),
          ElevatedButton(
            onPressed: () {
              final bimestre = int.parse(bimestreController.text);
              final valor = double.parse(valorController.text);
              final nota = Nota(id: 0, disciplinaId: disciplinaId, bimestre: bimestre, valor: valor);
              store.addNota(disciplinaId, nota);
            },
            child: Text('Adicionar Nota'),
          ),
        ],
      ),
    );
  }
}
