import 'package:mobx/mobx.dart';
import '../models/disciplina.dart';
import '../models/nota.dart';

// part 'academic_store.g.dart';

class AcademicStore = _AcademicStore with _$AcademicStore;

abstract class _AcademicStore with Store {
  @observable
  ObservableList<Disciplina> disciplinas = ObservableList<Disciplina>();

  @action
  void addDisciplina(Disciplina disciplina) {
    disciplinas.add(disciplina);
  }

  @action
  void addNota(int disciplinaId, Nota nota) {
    var disciplina = disciplinas.firstWhere((d) => d.id == disciplinaId);
    disciplina.notas.add(nota);
  }

double calcularMedia(Disciplina disciplina) {
  if (disciplina.notas.isEmpty) return 0.0;
  var totalNotas = disciplina.notas.fold(0.0, (sum, nota) => sum + nota.valor);
  return totalNotas / disciplina.notas.length;
}


  bool verificarAprovacao(Disciplina disciplina) {
    double media = calcularMedia(disciplina);
    return media >= 5.0;
  }
}
