import 'package:todo/src/data/db/task_db.dart';
import 'package:todo/src/data/models/task.dart';
import 'package:todo/src/data/repositories/task_repository.dart';

class TaskRepository implements TaskRepositoryInterface {
  final TaskDb _db;

  // Takes an instance of VirtualDB as a parameter in its constructor
  TaskRepository(this._db);

  // Retrieve a list of tasks
  // then maps each item to a Task object using Task.fromMap()
  @override
  Future<List<Task>> getAll() async {
    await Future.delayed(const Duration(milliseconds: 500));
    var items = await _db.list();
    return items.map((item) => Task.fromMap(item)).toList();
  }

  // Retrieve a single task with the specified id
  // then maps it to a Task object using Task.fromMap()
  @override
  Future<Task?> getOne(String id) async {
    await Future.delayed(const Duration(milliseconds: 500));
    var item = await _db.findOne(id);
    return item != null ? Task.fromMap(item) : null;
  }

  // Inserts a new task
  // converts Task object to Map using toMap()
  @override
  Future<String> addTask(Task task) async {
    await Future.delayed(const Duration(seconds: 2));
    return _db.insert(task.toMap());
  }

  // Updates a  task
  // converts Task object to Map using toMap()
  @override
  Future<void> updateTask(Task task) async {
    await Future.delayed(const Duration(seconds: 2));
    _db.update(task.toMap());
  }

  // Delete a task with the specified id
  @override
  Future<void> deleteTask(String id) async {
    await Future.delayed(const Duration(seconds: 2));
    _db.remove(id);
  }
}