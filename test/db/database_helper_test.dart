import 'package:flutter_test/flutter_test.dart';
import 'package:trabalho_final_flutter/db/database_helper.dart';
import 'package:trabalho_final_flutter/models/disciplina.dart';
import 'package:trabalho_final_flutter/models/nota.dart';


void main() {
  test('DatabaseHelper test', () async {
    final dbHelper = DatabaseHelper();

    final disciplina = Disciplina(id: 1, nome: 'Matemática', isAnual: true);
    await dbHelper.insertDisciplina(disciplina);

    final nota = Nota(id: 1, disciplinaId: 1, bimestre: 1, valor: 7.5);
    await dbHelper.insertNota(nota);

    // Adicione consultas e assertivas para verificar a inserção correta
  });
}
