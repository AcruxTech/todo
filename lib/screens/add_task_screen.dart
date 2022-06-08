import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task_data.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({ Key? key}) : super(key: key);
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen>{
  String newTaskTitle = 'Не указано';
  int importance = 0;
 
  @override
  Widget build(BuildContext context) {
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
              'Добавить задачу',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.blue,
                fontSize: 30.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            ListTile(  
              title: const Text('Низкая важность'),  
              leading: Radio(  
                value: 0,  
                groupValue: importance,  
                onChanged: (value) {  
                  setState(() {  
                    importance = 0;   
                  });    
                },  
              ),  
            ),  
            ListTile(  
              title: const Text('Средняя важность'),  
              leading: Radio(  
                value: 1,  
                groupValue: importance,  
                onChanged: (value) {  
                  setState(() {  
                    importance = 1;   
                  });  
                },  
              ),  
            ),  
            ListTile(  
              title: const Text('Высокая важность'),  
              leading: Radio(  
                value: 2,  
                groupValue: importance,  
                onChanged: (value) {  
                  setState(() {  
                    importance = 2;   
                  });  
                },  
              ),  
            ),  
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 25.0,
              ),
              onChanged: (newText) {
                newTaskTitle = newText;
              },
            ),
            const SizedBox(
              height: 20.0,
            ),
            MaterialButton(
              onPressed: () {
                Provider.of<TaskData>(context, listen: false).addTask(newTaskTitle, importance);
                Navigator.pop(context);
              },
              color: Colors.blue,
              child: const Text(
                'Добавить',
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