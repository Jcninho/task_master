import 'package:task_master/data/datasources/task_dao.dart';

import '../models/task.dart';

class TaskRepository {
  final TaskDao _taskDao = TaskDao();

  Future<bool> addTask(Task task) async {
    try {
      final id = await _taskDao.create(task);
      return id > 0;
    } catch (e) {
      print('❌ Erreur (repository) lors de l’ajout : $e');
      return false;
    }
  }

  Future<Task?> getTask(int id) async {
    try {
      final result = await _taskDao.read(id);
      return Task.fromJson(result.first);
    } catch (e) {
      print('❌ Erreur (repository) lors du chargement : $e');
      return null;
    }
  }

  Future<List<Task>> getTasks() async {
    try {
      final result = await _taskDao.readAll();
      return result.map(Task.fromJson).toList();
    } catch (e) {
      print('❌ Erreur (repository) lors du chargement : $e');
      return [];
    }
  }

  Future<bool> updateTask(Task task) async {
    try {
      final count = await _taskDao.update(task);
      return count > 0;
    } catch (e) {
      print('❌ Erreur (repository) update : $e');
      return false;
    }
  }

  Future<bool> deleteTask(int id) async {
    try {
      final count = await _taskDao.delete(id);
      return count > 0;
    } catch (e) {
      print('❌ Erreur (repository) delete : $e');
      return false;
    }
  }
}
