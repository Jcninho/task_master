import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_master/data/repositories/task_repository.dart';

import '../../data/models/task.dart';

class TaskController extends AsyncNotifier<List<Task>> {
  final TaskRepository _repository = TaskRepository();

  @override
  Future<List<Task>> build() async => await _repository.getTasks();

  Future<void> loadTasks() async {
    final tasks = await _repository.getTasks();
    state = AsyncValue.data(tasks);
  }

  Future<Task?> getTask(int id) async => await _repository.getTask(id);

  Future<bool> addTask(Task task) async {
    state = const AsyncValue.loading();
    final result = await _repository.addTask(task);
    state = await AsyncValue.guard(() => _repository.getTasks());
    return result;
  }

  Future<bool> updateTask(Task task) async {
    state = const AsyncValue.loading();
    final result = await _repository.updateTask(task);
    state = await AsyncValue.guard(() => _repository.getTasks());
    return result;
  }

  Future<bool> deleteTask(int id) async {
    state = const AsyncValue.loading();
    final result = await _repository.deleteTask(id);
    state = await AsyncValue.guard(() => _repository.getTasks());
    return result;
  }
}

final taskControllerProvider =
    AsyncNotifierProvider<TaskController, List<Task>>(TaskController.new);
