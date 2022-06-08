import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'task.dart';

class TaskData extends ChangeNotifier {
  final List<Task> _tasks = [];               // переменная для хранения списка дел]
  
   // метод возвращения всего списка задач
  UnmodifiableListView<Task> get tasks {     
    return UnmodifiableListView(_tasks);
  }

  // получаем количество задач
  int get taskCount {                         
    return _tasks.length;
  }

  // добавление задачи
  void addTask(String taskTitle, int importance) {          
    _tasks.add(Task(name: taskTitle, importance: importance));
    _tasks.sort(((a, b) => a.importance.compareTo(b.importance)));
    notifyListeners();         // сообщаем приложению, чтобы было внесено изменение
  }

  // обновление состояния (сделано или нет)
  void updateStateTask(Task task) {                
    task.toggleDone();      
    notifyListeners();
  }

  // обновление текста
  void updateTextTask(int id, String newTaskTitle) {                
    Task task = _tasks[id];
    task.update(newTaskTitle);      
    notifyListeners();
  }

  // удаление
  void deleteTask(Task task) {                
    _tasks.remove(task);
    notifyListeners();
  }
}
