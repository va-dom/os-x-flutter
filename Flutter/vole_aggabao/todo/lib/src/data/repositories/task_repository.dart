import 'package:todo/src/data/models/task.dart';

abstract class TaskRepositoryInterface {
  Future<List<Task>> getAll();
  Future<Task?> getOne(String id);
  Future<void> addTask(Task task);
  Future<void> updateTask(Task task);
  Future<void> deleteTask(String id);
}