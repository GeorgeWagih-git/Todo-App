import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/Screens/home_page.dart';
import 'package:project/Todo_Bloc/todo_bloc.dart';
import 'package:project/tasks_bloc/tasks_bloc.dart';
import 'package:project/tasks_bloc/tasks_events.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TodoBloc()),
        BlocProvider(
          create: (context) => TasksBloc()..add(CreateDatabaseEvent()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          primary: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
    );
  }
}
