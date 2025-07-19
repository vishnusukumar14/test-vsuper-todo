import 'package:uuid/uuid.dart';

class TodoItem {
  final String id;
  final String title;
  final String description;
  final bool isCompleted;

  TodoItem({
    required this.id,
    required this.title,
    required this.description,
    required this.isCompleted,
  });

  factory TodoItem.create({
    required String title,
    required String description,
  }) {
    return TodoItem(
      id: Uuid().v4(),
      title: title,
      description: description,
      isCompleted: false,
    );
  }

  TodoItem copyWith({
    String? id,
    String? title,
    String? description,
    bool? isCompleted,
  }) {
    return TodoItem(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
