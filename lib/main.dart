import 'package:flutter/material.dart';
import 'package:flutter_demo/core/app_theme.dart';
import 'package:flutter_demo/presentation/screens/to_do_screen/to_do_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'data/repositories/todo_repository.dart';
import 'domain/cubit/todo/todo_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme,
      home: BlocProvider(
        create: (context) => TodoCubit(TodoRepository()),
        child: TodoScreen(),
      )
    );
  }
}
