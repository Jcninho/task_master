import 'package:flutter/material.dart';
import 'package:task_master/presentation/widgets/task_tile.dart';

import '../../data/models/task.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({super.key, required this.tasks});

  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return TaskTile(taskId: tasks[index].id!);
      }, childCount: tasks.length),
    );
  }
}
