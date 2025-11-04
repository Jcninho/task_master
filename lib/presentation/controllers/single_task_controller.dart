import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_master/data/models/task.dart';
import 'package:task_master/data/repositories/task_repository.dart';

final singleTaskProvider = FutureProvider.family<Task?, int>((ref, id) async {
  return await TaskRepository().getTask(id);
});
