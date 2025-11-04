class TaskField {
  static const List<String> values = [id, description, isCompleted, createdAt];

  static const String tableName = 'tasks';

  static const String id = 'id';
  static const String description = 'description';
  static const String isCompleted = 'is_completed';
  static const String createdAt = 'created_at';
}
