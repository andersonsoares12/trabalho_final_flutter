import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../stores/academic_store.dart';
import '../models/disciplina.dart';
import 'nota_screen.dart'; // Importar a tela para adicionar notas

class AddDisciplinaScreen extends StatefulWidget {
  const AddDisciplinaScreen({super.key});

  @override
  _AddDisciplinaScreenState createState() => _AddDisciplinaScreenState();
}

class _AddDisciplinaScreenState extends State<AddDisciplinaScreen> {
  final TextEditingController _nomeController = TextEditingController();
  bool _isAnual = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Disciplina'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nomeController,
              decoration:
                  const InputDecoration(labelText: 'Nome da Disciplina'),
            ),
            SwitchListTile(
              title: const Text('Anual'),
              value: _isAnual,
              onChanged: (value) {
                setState(() {
                  _isAnual = value;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final nome = _nomeController.text;

                if (nome.isNotEmpty) {
                  final newDisciplina = Disciplina(
                    id: DateTime.now().millisecondsSinceEpoch,
                    nome: nome,
                    isAnual: _isAnual,
                  );

                  final store =
                      Provider.of<AcademicStore>(context, listen: false);
                  store.addDisciplina(newDisciplina);

                  if (kDebugMode) {
                    print('Disciplinas após adição: ${store.disciplinas}');
                  }

                  // Navegar para a tela de adicionar notas para a nova disciplina
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NotaScreen(
                        store: store,
                        disciplinaId: newDisciplina.id,
                      ),
                    ),
                  ).then((_) {
                    Navigator.pop(context); // Voltar para a tela anterior
                  });
                }
              },
              child: const Text('Adicionar'),
            ),
          ],
        ),
      ),
    );
  }
}
