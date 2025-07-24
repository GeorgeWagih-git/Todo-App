import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/tasks_bloc/tasks_events.dart';
import 'package:project/tasks_bloc/tasks_states.dart';

class TasksBloc extends Bloc<TasksEvents, TasksStates> {
  TasksBloc() : super(InitTaskState()) {
    on<CreateNewTaskEvent>((event, emit) {});
  }
}
