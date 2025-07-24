import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/tasks_bloc/tasks_bloc.dart';
import 'package:project/tasks_bloc/tasks_states.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksStates>(
      builder: (context, state) {
        return state is GetTasksState
            ? ListView.builder(
                itemCount: state.tasks.length,
                itemBuilder: (context, index) {
                  return Text(
                    state.tasks[index]['title'],
                    style: TextStyle(fontSize: 30),
                  );
                },
              )
            : Center(
                child: Text(
                  'No data to display',
                  style: TextStyle(fontSize: 30),
                ),
              );
      },
    );
  }
}
