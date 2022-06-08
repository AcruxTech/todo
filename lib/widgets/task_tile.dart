import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final int importance;
  final dynamic checkboxCallback;
  final dynamic longPressCallback;
  final dynamic shortPressCallback;

  TaskTile({
    required this.isChecked,
    required this.taskTitle,
    required this.importance,
    required this.checkboxCallback,
    required this.longPressCallback,
    required this.shortPressCallback
  });

  checkColor(int importance) {
    switch(importance) {
      case 0: return Colors.blue;
      case 1: return Colors.green;
      case 2: return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallback,
      onTap: shortPressCallback,
      title: Text(
        taskTitle,
        style: TextStyle(
          fontSize: 18.0,
          decoration: isChecked ? TextDecoration.lineThrough : null,
          color: checkColor(importance) 
        ),
      ),
      leading: Checkbox(
        value: isChecked,
        onChanged: checkboxCallback,
      ),
      trailing: MaterialButton(
        onPressed: longPressCallback,
        child: const Icon(
          Icons.delete_forever_outlined,
          color: Colors.grey,
        )
      ),
    );
  }
}
