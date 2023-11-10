import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/task.dart';

class FirestoreService {
  final CollectionReference tasks = FirebaseFirestore.instance.collection('tasks');

  Stream<QuerySnapshot> getTasks() {
    return tasks.snapshots();
  }

  Future<void> addTask(Task task) {
    return tasks.add({
      'taskTitle': task.title.toString(),
      'taskDesc': task.description.toString(),
      'taskCategory': task.category.toString(),
    });
  }
}



  
