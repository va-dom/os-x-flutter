import 'dart:math';
import 'package:flutter/material.dart';
import 'package:todo/src/data/models/category.dart';

class CategoryDb {
  final List<Map<String, dynamic>> _categories = [];
  static final CategoryDb _db = CategoryDb._privateConstructor();

  CategoryDb._privateConstructor();

  factory CategoryDb() {
    return _db;
  }

  Future<void> insert(Map<String, dynamic> category) async {
    category['id'] = _categories.length + 1;
    _categories.add(category);
  }

  Future<void> update(Map<String, dynamic> updatedCategory) async {
    int i = _categories.indexWhere((item) => item['id'] == updatedCategory['id']);
    _categories[i] = updatedCategory;
  }

  Future<void> remove(int id) async {
    _categories.removeWhere((item) => item['id'] == id);
  }

  Future<List<Map<String, dynamic>>> list() async {
    await Future.delayed(const Duration(milliseconds: 800));
    return _categories;
  }

  Future<Map<String, dynamic>?> findOne(int id) async {
    return _categories.firstWhere((category) => category['id'] == id);
  }

  // Method to generate sample data
  void generateSampleData() {
    List<String> categoriesSample = ['Personal', 'Work', 'Health', 'Fitness', 'Education', 'Family', 'Travel', 'Shopping', 'Other'];
    for (int i = 0; i < categoriesSample.length; i++) {
      Category item = Category(
        id: i + 1,
        name: categoriesSample[i],
        color: generateColor(),
      );
      _categories.add(item.toMap());
    }
  }

  Color generateColor() {
    Random rand = Random();
    int r = rand.nextInt(16) * 16;
    int g = rand.nextInt(16) * 16;
    int b = rand.nextInt(16) * 16;
    return Color.fromARGB(255, r, g, b);
  }
}