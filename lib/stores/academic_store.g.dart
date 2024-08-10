// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'academic_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AcademicStore on _AcademicStore, Store {
  late final _$disciplinasAtom =
      Atom(name: '_AcademicStore.disciplinas', context: context);

  @override
  ObservableList<Disciplina> get disciplinas {
    _$disciplinasAtom.reportRead();
    return super.disciplinas;
  }

  @override
  set disciplinas(ObservableList<Disciplina> value) {
    _$disciplinasAtom.reportWrite(value, super.disciplinas, () {
      super.disciplinas = value;
    });
  }

  late final _$_AcademicStoreActionController =
      ActionController(name: '_AcademicStore', context: context);

  @override
  void addDisciplina(Disciplina disciplina) {
    final _$actionInfo = _$_AcademicStoreActionController.startAction(
        name: '_AcademicStore.addDisciplina');
    try {
      return super.addDisciplina(disciplina);
    } finally {
      _$_AcademicStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addNota(int disciplinaId, Nota nota) {
    final _$actionInfo = _$_AcademicStoreActionController.startAction(
        name: '_AcademicStore.addNota');
    try {
      return super.addNota(disciplinaId, nota);
    } finally {
      _$_AcademicStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
disciplinas: ${disciplinas}
    ''';
  }
}
