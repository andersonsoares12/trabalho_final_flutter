import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import '../stores/academic_store.dart';
import 'add_disciplina_screen.dart';
import 'nota_screen.dart'; // Importa a tela de adicionar notas

class DisciplinaScreen extends StatelessWidget {
  const DisciplinaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        final store = Provider.of<AcademicStore>(context);

        return Scaffold(
          appBar: AppBar(
            title: const Center(
              child: Text(
                'Disciplinas',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.deepOrange,
                ),
              ),
            ),
            toolbarHeight: kToolbarHeight, // Define a altura do AppBar
          ),
          body: Column(
            children: [
              const Padding(padding: EdgeInsets.all(15)),
              Expanded(
                child: ListView.builder(
                  itemCount: store.disciplinas.length,
                  itemBuilder: (context, index) {
                    final disciplina = store.disciplinas[index];
                    final media = store.calcularMedia(disciplina);
                    final aprovado = store.verificarAprovacao(disciplina);

                    return ExpansionTile(
                      title: Text(
                        disciplina.nome,
                        style:
                            const TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      subtitle:
                          Text(disciplina.isAnual ? 'Anual' : 'Semestral'),
                      children: <Widget>[
                        Column(
                          children: disciplina.notas.map((nota) {
                            return ListTile(
                              title: Text(
                                'Bimestre ${nota.bimestre}',
                                style: const TextStyle(color: Colors.blueGrey),
                              ),
                              subtitle: Text(
                                  'Nota: ${nota.valor.toStringAsFixed(2)}'),
                            );
                          }).toList(),
                        ),
                        ListTile(
                          title: const Text('Média'),
                          subtitle: Text(
                            media > 0
                                ? 'Média: ${media.toStringAsFixed(2)}'
                                : 'Nenhuma nota lançada',
                          ),
                        ),
                        ListTile(
                          title: const Text('Status'),
                          subtitle: Text(
                            aprovado ? 'Aprovado' : 'Reprovado',
                            style: TextStyle(
                              color: aprovado
                                  ? Colors.green
                                  : Colors
                                      .red, // Defina cores com base na condição
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NotaScreen(
                                  store: store, // Adiciona o parâmetro store
                                  disciplinaId: disciplina.id,
                                ),
                              ),
                            );
                          },
                          child: const Text('Adicionar Nota'),
                        ),
                      ],
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddDisciplinaScreen(),
                    ),
                  );
                },
                child: const Text('Adicionar Disciplina'),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        );
      },
    );
  }
}
