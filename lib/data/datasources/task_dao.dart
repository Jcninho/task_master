import 'package:task_master/data/datasources/task_database.dart';

import '../../core/utils/task_field.dart';
import '../models/task.dart';

class TaskDao {
  Future<int> create(Task task) async {
    final db = await TaskDatabase.instance.database;
    return await db.insert(TaskField.tableName, task.toJson());
  }

  Future<List<Map<String, Object?>>> read(int id) async {
    final db = await TaskDatabase.instance.database;
    final task = await db.query(
      TaskField.tableName,
      where: '${TaskField.id} = ?',
      whereArgs: [id],
    );
    return task;
  }

  Future<List<Map<String, Object?>>> readAll() async {
    final db = await TaskDatabase.instance.database;
    return await db.query(TaskField.tableName);
  }

  Future<int> update(Task task) async {
    final db = await TaskDatabase.instance.database;
    return await db.update(
      TaskField.tableName,
      task.toJson(),
      where: '${TaskField.id} = ?',
      whereArgs: [task.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await TaskDatabase.instance.database;
    return await db.delete(
      TaskField.tableName,
      where: '${TaskField.id} = ?',
      whereArgs: [id],
    );
  }
}
