import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/tasks_bloc/tasks_events.dart';
import 'package:project/tasks_bloc/tasks_states.dart';
import 'package:sqflite/sqflite.dart';

class TasksBloc extends Bloc<TasksEvents, TasksStates> {
  Database? db;
  TasksBloc() : super(InitTaskState()) {
    on<CreateDatabaseEvent>((event, emit) async {
      print('making database');
      db = await openDatabase(
        'todo_app.db',
        version: 1,
        onCreate: (db, version) async {
          await db.execute(
            'CREATE TABLE Tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT)',
          );
        },
      );
      print(db);
      final result = await db!.rawQuery(
        "SELECT name FROM sqlite_master WHERE type='table' AND name='Tasks'",
      );

      if (result.isNotEmpty) {
        print("✅ Tasks table exists");
      } else {
        print("❌ Tasks table not exists");
      }
    });
    on<CreateNewTaskEvent>((event, emit) async {
      print('insert a new task');
      try {
        await db?.transaction((txn) async {
          int id1 = await txn.rawInsert(
            'INSERT INTO Tasks(title, date, time) VALUES (?, ?, ?)',
            [event.task.title, event.task.date, event.task.time],
          );
          print('inserted task 1 successful: $id1');
          emit(NewTaskInsertedState(task: event.task));
        });
      } catch (e) {
        print('Database error: $e');
      }
    });
    on<GetDatabaseTasksEvent>((event, emit) async {
      List<Map>? list = await db?.rawQuery('SELECT * FROM Tasks');

      print('when get tasks from table : $list');
      emit(GetTasksState(tasks: list!));
    });
    on<DeleteTaskEvent>((event, emit) async {});
  }
}
