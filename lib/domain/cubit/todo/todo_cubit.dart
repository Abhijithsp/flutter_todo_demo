import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/domain/cubit/todo/todo_state.dart';

import '../../../data/models/todo_model.dart';
import '../../../data/repositories/todo_repository.dart';


class TodoCubit extends Cubit<TodoState> {
  final TodoRepository repository;

  TodoCubit(this.repository) : super(TodoInitial()) {
    loadTodos();
  }

  Future<void> loadTodos() async {
    emit(TodoLoading());
    try {
      final todos = await repository.getTodos();
      emit(TodoLoaded(todos));
    } catch (e) {
      emit(TodoError('Failed to load todos'));
    }
  }

  Future<void> addTodo(String title,String description) async {
    final currentState = state;
    if (currentState is TodoLoaded) {
      final newTodo = TodoModel(id: DateTime.now().toString(), title: title,description:  description);
      await repository.addTodo(newTodo);
      final updatedTodos = List<TodoModel>.from(currentState.todos)..add(newTodo);
      emit(TodoLoaded(updatedTodos));
    }
  }

  Future<void> updateTodo(String id, String newTitle, String newDescription,bool isActive) async {
    final currentState = state;
    if (currentState is TodoLoaded) {
      final updatedTodos = currentState.todos.map((todo) {
        if (todo.id == id) {
          return TodoModel(id: id, title: newTitle,  description: newDescription,isActive: isActive,);
        }
        return todo;
      }).toList();
      final updatedTodo = updatedTodos.firstWhere((todo) => todo.id == id);
      await repository.updateTodo(updatedTodo);
      emit(TodoLoaded(updatedTodos));
    }
  }

  Future<void> deleteTodo(String id) async {
    final currentState = state;
    if (currentState is TodoLoaded) {
      final updatedTodos = currentState.todos.where((todo) => todo.id != id).toList();
      await repository.deleteTodo(id);
      emit(TodoLoaded(updatedTodos));
    }
  }
}