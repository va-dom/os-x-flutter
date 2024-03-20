import 'package:todo/src/data/db/category_db.dart';
import 'package:todo/src/data/models/category.dart';
import 'package:todo/src/data/repositories/category_repository.dart';

class CategoryRepository implements CategoryRepositoryInterface {
  final CategoryDb _db;

  // Takes an instance of CategoryDb as a parameter in its constructor
  CategoryRepository(this._db);

  // Retrieve a list of categorys
  // then maps each item to a Category object using Category.fromMap()
  @override
  Future<List<Category>> getAll() async {
    await Future.delayed(const Duration(milliseconds: 500));
    List<Map<String, dynamic>> items = await _db.list();
    return items.map((item) => Category.fromMap(item)).toList();
  }

  // Retrieve a single category with the specified id
  // then maps it to a Category object using Category.fromMap()
  @override
  Future<Category?> getOne(int id) async {
    await Future.delayed(const Duration(milliseconds: 500));
    Map<String, dynamic>? item = await _db.findOne(id);
    return item != null ? Category.fromMap(item) : null;
  }

  // Inserts a new category
  // converts Category object to Map using toMap()
  @override
  Future<void> addCategory(Category category) async {
    await Future.delayed(const Duration(seconds: 2));
    _db.insert(category.toMap());
  }

  // Updates a  category
  // converts Category object to Map using toMap()
  @override
  Future<void> updateCategory(Category category) async {
    await Future.delayed(const Duration(seconds: 2));
    _db.update(category.toMap());
  }

  // Delete a category with the specified id
  @override
  Future<void> deleteCategory(int id) async {
    await Future.delayed(const Duration(seconds: 2));
    _db.remove(id);
  }
}