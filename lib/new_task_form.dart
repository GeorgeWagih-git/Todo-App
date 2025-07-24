import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/classes/task_class.dart';
import 'package:project/tasks_bloc/tasks_bloc.dart';
import 'package:project/tasks_bloc/tasks_events.dart';
import 'package:project/tasks_bloc/tasks_states.dart';

// ignore: must_be_immutable
class NewTaskForm extends StatelessWidget {
  NewTaskForm({super.key});
  var titleController = TextEditingController();
  var dateController = TextEditingController();
  var timeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksStates>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: Text(
                    'Add Task',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                    label: Text('Task Title'),
                  ),
                ),
                SizedBox(height: 30),
                TextField(
                  controller: dateController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                    label: Text('Date'),
                    prefixIcon: Icon(Icons.calendar_month),
                  ),
                  onTap: () async {
                    var date = await showDatePicker(
                      context: context,
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2026),
                    );
                    if (date != null) {
                      String day = date.day.toString();
                      String month = date.month.toString();
                      String year = date.year.toString();
                      dateController.text = '$day-$month-$year';
                    } else {
                      dateController.text = '';
                    }
                  },
                ),
                SizedBox(height: 30),
                TextField(
                  controller: timeController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.access_time),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                    label: Text('Time'),
                  ),
                  onTap: () async {
                    var time = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (time != null) {
                      timeController.text = time.format(context).toString();
                    } else {
                      timeController.text = '';
                    }
                  },
                ),
                SizedBox(height: 30),
                MaterialButton(
                  color: Colors.deepPurple,
                  textColor: Colors.white,
                  onPressed: () {
                    BlocProvider.of<TasksBloc>(context).add(
                      CreateNewTaskEvent(
                        task: Task(
                          title: titleController.text,
                          date: dateController.text,
                          time: timeController.text,
                        ),
                      ),
                    );
                  },
                  child: Text('Confirm'),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        );
      },
    );
  }
}
