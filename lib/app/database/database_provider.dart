import 'package:notes/app/model/note_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  DatabaseProvider._();
  static final DatabaseProvider db = DatabaseProvider._();
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await initBD();
    return _database;
  }

  initBD() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, "note_app.db");
    return await openDatabase(
      path,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE notes (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            body TEXT,
            creationDate DATE
          )
        ''');
      },
      version: 1,
    );
  }

  // Método que adicionará uma nova nota
  addNewNote(NoteModel note) async {
    final db = await database;

    if (db != null) {
      db.insert(
        "notes",
        note.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    return null;
  }

  // Método que busca no nosso banco e retorna todas as notas
  Future<dynamic> getNotes() async {
    final db = await database;
    if (db != null) {
      var res = await db.query("notes");
      if (res.isEmpty) {
        return null;
      } else {
        var resultMap = res.toList();
        return resultMap.isNotEmpty ? resultMap : null;
      }
    }
  }
}
