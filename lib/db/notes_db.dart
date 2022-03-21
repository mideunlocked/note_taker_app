import 'package:note_taker/demo_data.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class NotesDataBase {
  static final NotesDataBase instance = NotesDataBase._init();

  static Database? _database;

  NotesDataBase._init();

  Future<Database?> get database async {
    if (_database != null) return _database;

    _database = await _initDB('notesApp.db');

    return _database;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1);
  }

  Future _createDB(Database db, int version) async {
    await db.execute(''' 
CREATE TABLE $tableNotes (
${NoteFields.id} INTEGER PRIMARY KEY AUTOINCREMENT,
${NoteFields.title} TEXT NOT NULL,
${NoteFields.body} TEXT NOT NULL,
${NoteFields.timeAdded.toString()} TEXT NOT NULL,
// ${NoteFields.category} TEXT NOT NULL, 
)
''');
  }

  Future<Note> create(Note note) async {
    final db = await instance.database;

    final id = await db!.insert(tableNotes, note.toJson());

    return note.copy(id: id);
  }

  Future<Note> readNotes(int id) async {
    final db = await instance.database;

    final maps = await db!.query(
      tableNotes,
      columns: NoteFields.values,
      where: '${NoteFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Note.fromJson(maps.first);
    } else {
      throw Exception('Id $id not found');
    }
  }

  Future<List<Note>> readAllNotes() async {
    final db = await instance.database;

    final orderBy = '${NoteFields.timeAdded} ASC';

    final result = await db?.query(tableNotes, orderBy: orderBy);

    return result!.map((json) => Note.fromJson(json)) as List<Note>;
  }

  Future<int> update(Note note) async {
    final db = await instance.database;

    return db!.update(
      tableNotes,
      note.toJson(),
      where: '${NoteFields.id} = ?',
      whereArgs: [note.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return db!.delete(
      tableNotes,
      where: '${NoteFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db!.close();
  }
}
