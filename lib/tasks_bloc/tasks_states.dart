import 'package:project/classes/task_class.dart';

abstract class TasksStates {}

class InitTaskState extends TasksStates {}

class NewTaskInsertedState extends TasksStates {
  Task task;
  NewTaskInsertedState({required this.task});
}
