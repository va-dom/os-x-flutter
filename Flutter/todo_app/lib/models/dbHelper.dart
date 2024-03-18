import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:todo_app/models/tasks.dart';
import 'package:todo_app/models/categories.dart';

class DatabaseHelper {
  //Define private static var _instance and initializes it with _internal constructor
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static DatabaseHelper get instance => _instance; //Static getter

  static Database? _db;

  DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDb();
    return _db!;
  }

  //Initializes the database
  Future<Database> initDb() async {
    String path = join(await getDatabasesPath(), 'tasks.db');
    return openDatabase(path, version: 1, onCreate: _onCreate);
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE categories (
        id INTEGER PRIMARY KEY,
        categoryLabel TEXT,
        isActive INTEGER,
        createdOn INTEGER,
        updatedOn INTEGER
      )
    ''');

    await db.execute('''
      CREATE TABLE tasks (
        id INTEGER PRIMARY KEY,
        categoryId INTEGER,
        taskTitle TEXT, 
        description TEXT,
        isCompleted INTEGER,
        isFavorite INTEGER,
        createdOn INTEGER,
        updatedOn INTEGER,
        FOREIGN KEY (categoryId) REFERENCES categories (id)
      )
    ''');
    //taskTitle TEXT NOT NULL CHECK(LENGTH(taskTitle) <= 25)
  }

  Future<int> insertTask(Task task) async {
    final db = await _instance.db;
    return await db.insert('tasks', task.toMap());
  }

  Future<List<Task>> getAllTasks() async {
    final db = await _instance.db;
    final List<Map<String, dynamic>> tasks = await db.query('tasks');
    return List.generate(tasks.length, (i) {
      return Task.fromMap(tasks[i]);
    });
  }

  Future<Map<String, dynamic>?> getTaskById(int? taskId) async {
    final Database dbInstance = await db;
    List<Map<String, dynamic>> task = await dbInstance.query(
      'Tasks',
      where: 'id = ?',
      whereArgs: [taskId],
    );
    return task.isNotEmpty ? task.first : null;
  }

  Future<List<Task>> getTasksByCategory(int categoryId) async {
    final db = await _instance.db;
    final List<Map<String, dynamic>> tasks = await db.query(
      'tasks',
      where: 'categoryId = ?',
      whereArgs: [categoryId],
    );
    return List.generate(tasks.length, (i) {
      return Task.fromMap(tasks[i]);
    });
  }

  Future<int> updateTask(Task task) async {
    final db = await _instance.db;
    return await db.update(
      'tasks',
      task.toMap(),
      where: 'id = ?',
      whereArgs: [task.id],
    );
  }

  Future<void> updateTaskIsComplete(int? taskId, bool isComplete) async {
    final Database dbInstance = await db;
    await dbInstance.update(
      'Tasks',
      {'isCompleted': isComplete ? 1 : 0, 'updatedOn': DateTime.now().millisecondsSinceEpoch},
      where: 'id = ?',
      whereArgs: [taskId],
    );
  }

  Future<void> updateTaskIsBookmark(int? taskId, bool isBookmark) async {
    final Database dbInstance = await db;
    await dbInstance.update(
      'Tasks',
      {'isFavorite': isBookmark ? 1 : 0, 'updatedOn': DateTime.now().millisecondsSinceEpoch},
      where: 'id = ?',
      whereArgs: [taskId],
    );
  }

  Future<int> deleteTask(int id) async {
    final db = await _instance.db;
    return await db.delete(
      'tasks',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  //Category
  Future<int> insertCategory(Categories category) async {
    final db = await _instance.db;
    return await db.insert('categories', category.toMap());
  }

  Future<List<Categories>> getAllCategories() async {
    final db = await _instance.db;
    final List<Map<String, dynamic>> categories = await db.query('categories');
    return List.generate(categories.length, (i) {
      return Categories.fromMap(categories[i]);
    });
  }

  Future<Map<String, dynamic>?> getCategoryById(int? categoryId) async {
    final Database dbInstance = await db;
    List<Map<String, dynamic>> category = await dbInstance.query(
      'Categories',
      where: 'id = ?',
      whereArgs: [categoryId],
    );
    return category.isNotEmpty ? category.first : null;
  }

  Future<void> updateCategoryById(int? categoryId, String newText) async {
    final Database dbInstance = await db;
    await dbInstance.update(
      'Categories',
      {'categoryLabel': newText, 'updatedOn': DateTime.now().millisecondsSinceEpoch},
      where: 'id = ?',
      whereArgs: [categoryId],
    );
  }

  Future<int> updateCategory(Categories category) async {
    final db = await _instance.db;
    return await db.update(
      'categories',
      category.toMap(),
      where: 'id = ?',
      whereArgs: [category.id],
    );
  }

  Future<int> deleteCategory(int id) async {
    final db = await _instance.db;
    final tasksConnected = await db.query(
      'Tasks',
      where: 'categoryId = ?',
      whereArgs: [id]);

    for (var task in tasksConnected) {
      await db.delete(
        'Tasks',
        where: 'id = ?',
        whereArgs: [task['id']]);
    }

    return await db.delete(
      'categories',
      where: 'id = ?',
      whereArgs: [id],
    );
  }


}