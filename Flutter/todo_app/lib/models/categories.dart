import 'package:flutter/cupertino.dart';
import 'dbHelper.dart';

class Categories {
  final int? id;
  final String categoryLabel;
  final bool isActive;
  final int? createdOn;
  final int? updatedOn;

  Categories({
    this.id,
    required this.categoryLabel,
    required this.isActive,
    this.createdOn,
    this.updatedOn
  });

  //Method for converting 'Categories' into 'Map' of String,dynamic
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'categoryLabel': categoryLabel,
      'isActive': isActive ? 1 : 0,
      'createdOn': createdOn,
      'updatedOn': updatedOn,
    };
  }

  //Factory constructor to convert a Map<String,dynamic> into Categories
  factory Categories.fromMap(Map<String, dynamic> map) {
    return Categories(
      id: map['id'],
      categoryLabel: map['categoryLabel'],
      isActive: map['isActive'] == 1,
      createdOn: map['createdOn'],
      updatedOn: map['updatedOn'],
    );
  }

}

//Uses ChangeNotifier to notify listeners for changes
class CategoryProvider extends ChangeNotifier{
  late DatabaseHelper _dbHelper;

  CategoryProvider() {
    _dbHelper = DatabaseHelper();
  }

  //For adding new category
  Future<void> addCategory(Categories category) async {
    await DatabaseHelper.instance.insertCategory(category);
    notifyListeners();
  }

  //For getting all Categories
  Future<List<Categories>> get myCategories async {
    return await DatabaseHelper.instance.getAllCategories();
  }

  //For updating a category
  Future<void> updateCategory(Categories category) async {
    await DatabaseHelper.instance.updateCategory(category);
    notifyListeners();
  }

  //For deleting a category
  Future<void> deleteCategory(int id) async {
    await DatabaseHelper.instance.deleteCategory(id);
    notifyListeners();
  }

}