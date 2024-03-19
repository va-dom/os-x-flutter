import 'package:flutter/material.dart';

class Category {
  final int id;
  final String name;
  final Color color;

  Category({
    required this.id,
    required this.name,
    required this.color,
  });

  Category.fromMap(Map<String, dynamic> data) :
    id = data['id'] ?? 0,
    name = data['name'] ?? '',
    color = Color(data['color'] ?? 0xFFFFFFFF);

  Map<String, dynamic> toMap() => {
    'id': id,
    'name': name,
    'color': color.value, // Store color as integer
  };
}