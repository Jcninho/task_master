import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_master/presentation/views/add_task_view.dart';
import 'package:task_master/presentation/views/task_list_view.dart';

import '../../data/models/task.dart';
import '../controllers/task_controller.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncTasks = ref.watch(taskControllerProvider);
    return Scaffold(
      body: asyncTasks.when(
        data: (List<Task> data) {
          if (data.isEmpty) {
            return const Center(child: Text('Vous n\'avez pas de tâches'));
          }
          return SafeArea(
            child: CustomScrollView(slivers: [TaskListView(tasks: data)]),
          );
        },
        error: (Object error, StackTrace stackTrace) {
          return const Center(child: Text('Une erreur est survenue'));
        },
        loading: () => const CircularProgressIndicator(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (context) => AddTaskView()));
        },
      ),
    );
  }
}
