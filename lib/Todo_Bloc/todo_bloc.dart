import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/Screens/archived_screen.dart';
import 'package:project/Screens/done_screen.dart';
import 'package:project/Screens/tasks_screen.dart';

class TodoBloc extends Bloc<int, int> {
  List<Widget> pages = [TasksScreen(), DoneScreen(), ArchivedScreen()];
  List<String> titels = ['Tasks', 'Done', 'Archived'];
  TodoBloc() : super(0) {
    on<int>((event, emit) {
      emit(event);
    });
  }
}
