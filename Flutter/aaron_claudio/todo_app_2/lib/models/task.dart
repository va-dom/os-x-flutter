import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app_2/models/category.dart';

class Task {
  bool isChecked;
  final String? id;
  final String title;
  final String description;
  final DateTime? dateCreated;
  final DocumentReference<Object>? categoryReference;
  final Category category;

  Task(
      {required this.id,
      required this.title,
      this.isChecked = false,
      required this.description,
      required this.dateCreated,
      required this.categoryReference,
      required this.category});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'dateCreated': dateCreated,
      'categoryReference': categoryReference,
      'isChecked': isChecked,
    };
  }

  factory Task.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    final DocumentReference categoryRef = data['categoryReference'];
    return Task(
      id: snapshot.id,
      title: data['title'],
      description: data['description'],
      dateCreated: data['dateCreated'],
      categoryReference: categoryRef as DocumentReference<Object>,
      category: snapshot['category'],
    );
  }

  // bool isChecked;
  // final String? id;
  // final String title;
  // final String description;
  // final DateTime? dateCreated;
  // final Category category;

  // Task(
  //     {required this.id,
  //     required this.title,
  //     this.isChecked = false,
  //     required this.description,
  //     required this.dateCreated,
  //     required this.category});

  // @override
  // bool operator ==(covariant Task other) =>
  //     id == other.id &&
  //     title == other.title &&
  //     description == other.description;

  // @override
  // int get hashCode => Object.hashAll([
  //       id,
  //       title,
  //       description,
  //     ]);
}

List<Task> tasks = [];
