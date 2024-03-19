import 'package:todo/src/data/models/category.dart';

abstract class CategoryRepositoryInterface {
  Future<List<Category>> getAll();
  Future<Category?> getOne(int id);
  Future<void> addCategory(Category task);
  Future<void> updateCategory(Category task);
  Future<void> deleteCategory(int id);
}