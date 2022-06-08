import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task_data.dart';
import '../screens/update_task_screen.dart';

import 'task_tile.dart';

class TasksList extends StatelessWidget {
  const TasksList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (BuildContext context, taskData, Widget? child) {
        if (taskData.taskCount == 0) {
          return const Expanded(
            child: Center(
              child: Text(
                'Задач нет!',
                style: TextStyle(
                  fontSize: 26.0,
                  color: Colors.grey
                ),
              )
            )
          );
        }
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TaskTile(
              taskTitle: task.name,
              isChecked: task.isDone,
              importance: task.importance,
              checkboxCallback: (bool? checkboxState) {
                taskData.updateStateTask(task);
              },
              shortPressCallback: () {
                return showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: UpdateTaskScreen(index, task.name),
                    ),
                  )
                );
              },
              longPressCallback: () {
                taskData.deleteTask(task);
              }
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
