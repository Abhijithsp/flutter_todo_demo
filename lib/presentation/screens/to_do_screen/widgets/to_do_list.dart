import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/cubit/todo/todo_cubit.dart';
import '../../../../domain/cubit/todo/todo_state.dart';


class TodoList extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
   bool isActive = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoCubit, TodoState>(
      builder: (context, state) {
        if (state is TodoLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is TodoLoaded) {
          return ListView.builder(
            itemCount: state.todos.length,
            itemBuilder: (context, index) {
              final todo = state.todos[index];
              return ListTile(
                title: Text(todo.title),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        titleController.text = todo.title;
                        descriptionController.text = todo.description??'';
                        isActive=todo.isActive;
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title:  TextField(controller: titleController),
                            content: TextField(controller: descriptionController),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () {
                                  if (titleController.text.isNotEmpty) {
                                    context.read<TodoCubit>().updateTodo(
                                      todo.id,
                                      titleController.text,
                                      descriptionController.text,
                                      isActive,
                                    );
                                    Navigator.pop(context);
                                  }
                                },
                                child: Text('Save'),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        context.read<TodoCubit>().deleteTodo(todo.id);
                      },
                    ),
                  ],
                ),
              );
            },
          );
        } else if (state is TodoError) {
          return Center(child: Text(state.message));
        }
        return Center(child: Text('No todos available!'));
      },
    );
  }
}