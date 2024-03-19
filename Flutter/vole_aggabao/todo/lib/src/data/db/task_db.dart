import 'dart:math';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:todo/src/data/models/task.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();

class TaskDb {
  final List<Map<String, dynamic>> _items = [];
  static final TaskDb _db = TaskDb._privateConstructor();

  TaskDb._privateConstructor();

  factory TaskDb() {
    return _db;
  }

  Future<List<Map<String, dynamic>>> list() async {
    await Future.delayed(const Duration(milliseconds: 800));
    return _items;
  }

  Future<Map<String, dynamic>?> findOne(String id) async {
    return _items.firstWhere((item) => item['id'] == id);
  }

  Future<String> insert(Map<String, dynamic> item) async {
    // item['id'] = Random().nextInt(1000);
    item['id'] = _uuid.v4();
    _items.add(item);
    return item['id'];
  }

  Future<void> update(Map<String, dynamic> updatedItem) async {
    int i = _items.indexWhere((item) => item['id'] == updatedItem['id']);
    _items[i] = updatedItem;
  }

  Future<void> remove(String id) async {
    _items.removeWhere((item) => item['id'] == id);
  }

  void generateSampleData() {
    Random rand = Random();
    for (int i = 0; i < 10; i++) {
      Task task = Task(
        id: _uuid.v4(),
        description: removeLastCharacter(lorem(paragraphs: 1, words: rand.nextInt(5) + 2)),
        categoryId: rand.nextInt(9) + 1,
        dueDate: DateTime.now().add(Duration(days: Random().nextInt(7))),
        completed: Random().nextBool(),
      );
      _items.add(task.toMap());
    }
  }

  String removeLastCharacter(String str) {
    return str.substring(0, str.length -1);
  }
}