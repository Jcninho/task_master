import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_master/presentation/controllers/task_controller.dart';

import '../controllers/single_task_controller.dart';

class TaskTile extends ConsumerWidget {
  const TaskTile({super.key, required this.taskId});

  final int taskId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final task = ref.watch(singleTaskProvider(taskId));
    return task.when(
      data: (data) {
        if (data == null) {
          return const Center(child: Text('La tâche est introuvable'));
        }
        return ListTile(
          title: Text(data.description),
          trailing: Checkbox(
            value: data.isCompleted,
            onChanged: (value) {
              ref
                  .read(taskControllerProvider.notifier)
                  .updateTask(data.copyWith(isCompleted: !data.isCompleted));
            },
          ),
        );
      },
      error: (err, stack) =>
          const Center(child: Text('Une erreur est survenue')),
      loading: () => const CircularProgressIndicator(),
    );
  }
}
