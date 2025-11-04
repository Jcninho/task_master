import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../core/utils/task_field.dart';

class TaskDatabase {
  TaskDatabase._();

  static final TaskDatabase instance = TaskDatabase._();

  factory TaskDatabase() => instance;

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'tasks.db');

    return openDatabase(
      path,
      version: 1,
      onConfigure: _onConfigure,
      onCreate: _onCreate,
    );
  }

  Future<void> _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE ${TaskField.tableName} (
        ${TaskField.id} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${TaskField.description} TEXT NOT NULL,
        ${TaskField.isCompleted} INTEGER NOT NULL,
        ${TaskField.createdAt} TEXT NOT NULL
      )
    ''');
  }

  Future<void> close() async {
    final db = await instance.database;
    await db.close();
  }
}
