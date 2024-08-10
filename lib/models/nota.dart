class Nota {
  final int id;
  final int disciplinaId;
  final int bimestre;
  final double valor;

  Nota({
    required this.id,
    required this.disciplinaId,
    required this.bimestre,
    required this.valor,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'disciplinaId': disciplinaId,
      'bimestre': bimestre,
      'valor': valor,
    };
  }
}
