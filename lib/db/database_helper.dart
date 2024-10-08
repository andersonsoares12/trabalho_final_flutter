import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/disciplina.dart';
import '../models/nota.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), 'academic.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE disciplinas (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nome TEXT,
        isAnual INTEGER
      )
    ''');
    await db.execute('''
      CREATE TABLE notas (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        disciplinaId INTEGER,
        bimestre INTEGER,
        valor REAL,
        FOREIGN KEY(disciplinaId) REFERENCES disciplinas(id)
      )
    ''');
  }

  Future<void> insertDisciplina(Disciplina disciplina) async {
    final db = await database;
    await db.insert('disciplinas', disciplina.toMap());
  }

  Future<void> insertNota(Nota nota) async {
    final db = await database;
    await db.insert('notas', nota.toMap());
  }

  // Adicione métodos para consultar e atualizar dados aqui
}
