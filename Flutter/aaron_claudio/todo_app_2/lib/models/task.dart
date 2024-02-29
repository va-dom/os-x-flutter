import 'package:todo_app_2/models/category.dart';

class Task{
  bool isChecked;
  final String? id;
  final String title;
  final String description;
  final DateTime? dateCreated;
  final Category category;

  Task({
    required this.id,
    required this.title,
    this.isChecked = false,
    required this.description,
    required this.dateCreated,
    required this.category
  });

  @override
  bool operator == (covariant Task other) =>
    id == other.id &&
    title == other.title &&
    description == other.description;
    
      @override
      int get hashCode => Object.hashAll([
        id,
        title,
        description,
      ]);
    
}
List<Task> tasks = [];