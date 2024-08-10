import 'package:flutter_test/flutter_test.dart';
import 'package:trabalho_final_flutter/models/nota.dart';


void main() {
  test('Nota model test', () {
    final nota = Nota(id: 1, disciplinaId: 1, bimestre: 1, valor: 7.5);
    expect(nota.id, 1);
    expect(nota.disciplinaId, 1);
    expect(nota.bimestre, 1);
    expect(nota.valor, 7.5);
  });
}
