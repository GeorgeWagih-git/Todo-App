import 'package:project/classes/task_class.dart';

abstract class TasksEvents {}

class CreateNewTaskEvent extends TasksEvents {
  Task task;
  CreateNewTaskEvent({required this.task});
}

class DeleteTaskEvent extends TasksEvents {
  Task task;
  DeleteTaskEvent({required this.task});
}

class CreateDatabaseEvent extends TasksEvents {}
