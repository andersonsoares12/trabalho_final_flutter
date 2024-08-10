import 'package:flutter/material.dart';
import '../models/nota.dart';

class NotaTile extends StatelessWidget {
  final Nota nota;

  const NotaTile({super.key, required this.nota});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Bimestre ${nota.bimestre}'),
      subtitle: Text('Nota: ${nota.valor.toStringAsFixed(2)}'),
    );
  }
}
