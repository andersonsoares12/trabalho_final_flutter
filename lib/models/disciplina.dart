import 'package:trabalho_final_flutter/models/nota.dart';

class Disciplina {
  final int id;
  final String nome;
  final bool isAnual;
  List<Nota> notas;

  Disciplina({
    required this.id,
    required this.nome,
    required this.isAnual,
    this.notas = const [],
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'isAnual': isAnual ? 1 : 0,
    };
  }
}
