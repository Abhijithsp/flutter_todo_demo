

import '../../domain/entities/todo.dart';

class TodoModel extends Todo {
  TodoModel({required super.id, required super.title, required super.description,super.isActive});

  factory TodoModel.fromEntity(Todo todo) {
    return TodoModel(id: todo.id, title: todo.title,description:todo.description, isActive: todo.isActive);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'isActive': isActive ? 1 : 0,
    };
  }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      isActive: map['isActive'] == 1,
    );
  }
}