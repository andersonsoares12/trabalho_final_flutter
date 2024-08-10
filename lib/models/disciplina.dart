import 'nota.dart';

class Disciplina {
  final int id;
  final String nome;
  final bool isAnual;
  List<Nota> notas; // Use um List mutável

  Disciplina({
    required this.id,
    required this.nome,
    required this.isAnual,
    List<Nota>? notas,
  }) : notas =
            notas ?? []; // Inicializa com uma lista vazia se não for fornecida

  // Método para converter para Map, se necessário
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'isAnual': isAnual ? 1 : 0,
    };
  }
}
