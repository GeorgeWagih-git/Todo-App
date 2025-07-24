import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NewTaskForm extends StatelessWidget {
  NewTaskForm({super.key});
  var dateController = TextEditingController();
  var timeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
            TextField(
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
                  String month = date.day.toString();
                  String year = date.day.toString();
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
              onPressed: () {},
              child: Text('Confirm'),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
