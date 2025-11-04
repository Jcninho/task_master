import '../../core/utils/task_field.dart';

class Task {
  final int? id;
  final String description;
  final bool isCompleted;
  final DateTime createdAt;

  Task({
    this.id,
    required this.description,
    this.isCompleted = false,
    required this.createdAt,
  });

  Map<String, Object?> toJson() => {
    TaskField.id: id,
    TaskField.description: description,
    TaskField.isCompleted: isCompleted ? 1 : 0,
    TaskField.createdAt: createdAt.toIso8601String(),
  };

  factory Task.fromJson(Map<String, Object?> json) => Task(
    id: json[TaskField.id] as int,
    description: json[TaskField.description] as String,
    isCompleted: (json[TaskField.isCompleted] as int) == 1,
    createdAt: DateTime.parse(json[TaskField.createdAt] as String),
  );

  Task copyWith({
    int? id,
    String? description,
    bool? isCompleted,
    DateTime? createdAt,
  }) => Task(
    id: id ?? this.id,
    description: description ?? this.description,
    isCompleted: isCompleted ?? this.isCompleted,
    createdAt: createdAt ?? this.createdAt,
  );
}
