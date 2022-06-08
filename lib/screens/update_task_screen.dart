import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task_data.dart';

class UpdateTaskScreen extends StatelessWidget {
  int id = 0;
  String text = '';

  UpdateTaskScreen(int taskId, String oldText) {
    id = taskId;
    text = oldText;
  }

  @override
  Widget build(BuildContext context) {
    String newText = 'Не указано';

    return Container(
      color: const Color(0xFF757575),
      child: Container(
        decoration: 
          const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
          ),
        padding: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              'Обновить задачу',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.blue,
                fontSize: 30.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            TextFormField(
              initialValue: text,
              autofocus: true,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 25.0,
              ),
              onChanged: (text) {
                newText = text;
              },
            ),
            const SizedBox(
              height: 20.0,
            ),
            MaterialButton(
              onPressed: () {
                Provider.of<TaskData>(context, listen: false).updateTextTask(id, newText);
                Navigator.pop(context);
              },
              color: Colors.blue,
              child: const Text(
                'Обновить',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              textColor: Colors.white,
              height: 50.0,
            )
          ],
        ),
      ),
    );
  }
}
