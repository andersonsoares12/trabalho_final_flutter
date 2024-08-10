import 'package:flutter_test/flutter_test.dart';
import 'package:trabalho_final_flutter/models/disciplina.dart';
import 'package:trabalho_final_flutter/models/nota.dart';
import 'package:trabalho_final_flutter/stores/academic_store.dart';


void main() {
  test('AcademicStore test', () {
    final store = AcademicStore();

    final disciplina = Disciplina(id: 1, nome: 'Matemática', isAnual: true);
    store.addDisciplina(disciplina);

    expect(store.disciplinas.length, 1);

    final nota = Nota(id: 1, disciplinaId: 1, bimestre: 1, valor: 7.0);
    store.addNota(1, nota);

    expect(store.disciplinas.first.notas.length, 1);
    expect(store.calcularMedia(disciplina), 7.0);
    expect(store.verificarAprovacao(disciplina), true);
  });
}
