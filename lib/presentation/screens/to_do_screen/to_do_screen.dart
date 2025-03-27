import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/presentation/screens/to_do_screen/widgets/to_do_list.dart';

import '../../../core/app_strings.dart';
import '../../../domain/cubit/todo/todo_cubit.dart';

class TodoScreen extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppStrings.appTitle)),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: TextField(
                    controller: titleController,

                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      filled: true,
                      prefixIcon: Icon(Icons.account_box, color: Colors.grey),
                      contentPadding: EdgeInsets.only(left: 10, bottom: 5),
                      labelText: 'Title',
                      hintText: "Enter Title",
                      fillColor: Color(0xFFFFFFFF),
                    ),
                  ),
                ),
                Expanded(
                  child: TextField(
                    controller: descriptionController,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      filled: true,
                      prefixIcon: Icon(Icons.account_box, color: Colors.grey),
                      contentPadding: EdgeInsets.only(left: 10, bottom: 5),
                      labelText: 'Description',
                      hintText: "Enter Description",
                      fillColor: Color(0xFFFFFFFF),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (titleController.text.isNotEmpty) {
                      context.read<TodoCubit>().addTodo(
                        titleController.text,
                        descriptionController.text,
                      );
                      titleController.clear();
                      descriptionController.clear();
                    }
                  },
                  child: Container(
                    height: 45,
                    width: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromARGB(255, 45, 120, 234),
                          Color.fromARGB(255, 89, 149, 240),
                        ],
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Add",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: TodoList()),
        ],
      ),
    );
  }
}
