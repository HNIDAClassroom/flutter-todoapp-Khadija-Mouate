import 'package:flutter/material.dart';
import 'package:todolist_app/models/task.dart';
import 'package:todolist_app/service/firestore.dart';
import 'package:todolist_app/widgets/new_task.dart';
import 'tasks_list.dart';

class Tasks extends StatefulWidget {
  const Tasks({Key? key});

  @override
  State<Tasks> createState() {
    return _TasksState();
  }
}

class _TasksState extends State<Tasks> {
  final FirestoreService firestoreService = FirestoreService();
  final List<Task> _registeredTasks = [];

  Future<void> _addTask(Task task) async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      _registeredTasks.add(task);
    });
  }

  void _openAddTaskOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => NewTask(onAddTask: _addTask),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter ToDoList'),
        actions: [
          IconButton(
            onPressed: _openAddTaskOverlay,
            icon: Ink(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              ),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Icon(Icons.add),
              ),
            ),
          ),
        ],
      ),
      body: TasksList(taskStream: firestoreService.getTasks()),
    );
  }
}


