class Task {
  // описываем поля, которые есть у задачи
  String name;                    // название
  bool isDone;                    // сделана она или нет
  int importance;                 // важность (по возрастанию)
  // 0 - синий, 1 - зеленый, 2 - красный

  Task(                           // конструктор класса
    {
      required this.name,         // обязательно надо передать название
      this.isDone = false,        // автоматически делаем задачу невыполненной
      required this.importance
    }
  );

  void toggleDone() {             // метод для переключения состояния задачи
    isDone = !isDone;             // меняем текущее состояние на противоположное
  }

  void update(String newName) {   // обновление названия
    name = newName;
  }
}
