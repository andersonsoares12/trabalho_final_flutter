import 'package:flutter_test/flutter_test.dart';
import 'package:trabalho_final_flutter/models/disciplina.dart';


void main() {
  test('Disciplina model test', () {
    final disciplina = Disciplina(id: 1, nome: 'Matemática', isAnual: true);
    expect(disciplina.id, 1);
    expect(disciplina.nome, 'Matemática');
    expect(disciplina.isAnual, true);
  });
}
