import 'package:cloud_firestore/cloud_firestore.dart';

class Category {
  final String name;
  final DocumentReference<Object>? reference;

  Category({required this.name, this.reference});

  factory Category.fromSnapshot(DocumentSnapshot snapshot) {
    return Category(
        name: snapshot.get('name'),
        reference: snapshot.reference as DocumentReference<Object>?);
  }

  Map<String, dynamic> toMap() {
    return {'name': name};
  }
}

// class Category{
//   final String name;

//   Category(this.name);
// }