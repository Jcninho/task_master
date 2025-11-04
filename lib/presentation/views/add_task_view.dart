import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_master/data/models/task.dart';
import 'package:task_master/presentation/controllers/task_controller.dart';

class AddTaskView extends ConsumerWidget {
  AddTaskView({super.key});

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nouvelle tâche')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: controller),
            ElevatedButton(
              onPressed: () {
                final description = controller.text;
                if (description.isEmpty) return;

                final task = Task(
                  description: description,
                  createdAt: DateTime.now(),
                );

                ref.read(taskControllerProvider.notifier).addTask(task);
                ref.invalidate(taskControllerProvider);
              },
              child: const Text('Add Task'),
            ),
          ],
        ),
      ),
    );
  }
}
