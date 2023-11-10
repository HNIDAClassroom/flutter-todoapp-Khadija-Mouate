import 'package:flutter/material.dart';
import 'package:todolist_app/models/task.dart';

class NewTask extends StatefulWidget {
  const NewTask({Key? key, required this.onAddTask}) : super(key: key);

  final Future<void> Function(Task task) onAddTask;

  @override
  _NewTaskState createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  Category _selectedCategory = Category.personal;

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _submitTaskData() {
    if (_titleController.text.trim().isEmpty) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Erreur'),
          content: const Text(
            'Merci de saisir le titre de la tâche à ajouter dans la liste'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Okay'),
            ),
          ],
        ),
      );
      return;
    }

    // Créez une nouvelle tâche avec les données du formulaire
    Task newTask = Task(
      title: _titleController.text,
      description: _descriptionController.text,
      date: DateTime(2023, 10, 16, 14, 30),
      category: _selectedCategory,
    );

    // Appelez la fonction onAddTask du widget parent avec la nouvelle tâche
    widget.onAddTask(newTask);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // Votre code UI ici
    );
  }
}

