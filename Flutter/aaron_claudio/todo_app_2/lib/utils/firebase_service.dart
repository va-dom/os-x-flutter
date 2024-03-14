import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app_2/models/category.dart';
import 'package:todo_app_2/models/task.dart';

class FirebaseService {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static final CollectionReference _tasksCollection =
      _firestore.collection('tasks');

  static Future<void> addTask(Task task) async {
    try {
      await _tasksCollection.add({
        'title': task.title,
        'description': task.description,
        'dateCreated': task.dateCreated,
        'categoryReference': task.categoryReference,
        'isChecked': task.isChecked
      });
    } catch (e) {
      log('Error adding task: $e');
    }
  }

  static Future<void> updateTask(Task task) async {
    try {
      final DocumentReference taskRef = _tasksCollection.doc(task.id);
      await taskRef.update({
        'title': task.title,
        'description': task.description,
        'categoryReference': task.categoryReference,
        'isChecked': task.isChecked,
      });
    } catch (e) {
      log('Error updating task: $e');
    }
  }

  static Future<List<Task>> getTasks() async {
    try {
      final QuerySnapshot querySnapshot =
          await _firestore.collection('tasks').get();
      return querySnapshot.docs.map((doc) => Task.fromSnapshot(doc)).toList();
    } catch (e) {
      log("Error getting tasks: $e");
      return [];
    }
  }

  static Future<DocumentReference> addCategory(Category category) async {
    try {
      final docRef =
          await _firestore.collection('categories').add(category.toMap());
      return docRef;
    } catch (e) {
      log("Error adding category: $e");
      rethrow;
    }
  }

  static Future<List<Category>> getCategories() async {
    try {
      final QuerySnapshot querySnapshot =
          await _firestore.collection('categories').get();
      return querySnapshot.docs.map((doc) {
        return Category(
          name: doc['name'],
          reference: doc.reference
              as DocumentReference<Object>, // Populate the reference field
        );
      }).toList();
    } catch (e) {
      log("Error getting categories: $e");
      return [];
    }
  }
}
