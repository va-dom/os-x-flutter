import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/screens/taskList.dart';
import '../constants/colors.dart';
import '../models/categories.dart';
import 'categoryDialog.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.category});

  final Map<String, dynamic> category;

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context);
    var id = category['id'];
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        children: [
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Row(
                children: [
                  Container(
                    width: 100,
                    height: 20,
                    decoration: const BoxDecoration(
                        color: myOrange,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            topLeft: Radius.circular(5))),
                  ),
                ],
              )),
          Positioned.fill(
              child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TaskScreen(
                            categoryId: id,
                            categoryName: category['categoryLabel'],
                          )));
            },
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: const BoxDecoration(
                  color: myOrange,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(5),
                  )),
              alignment: Alignment.center,
              child: Text(
                category['categoryLabel']!,
                style: const TextStyle(
                  color: myOrangeAccent,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )),
          Positioned(
              top: 22,
              right: 0,
              child: Row(
                children: [
                  GestureDetector(
                      child: const Icon(
                        Icons.edit,
                        size: 25,
                        color: myOrangeAccent,
                      ),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return CategoryDialog(
                                labelController: TextEditingController(
                                    text: category['categoryLabel']!),
                                categoryLabel: category['categoryLabel']!,
                                id: category['id'],
                              );
                            });
                      }),
                  const SizedBox(width: 1),
                  GestureDetector(
                      child: const Icon(
                        Icons.delete,
                        size: 25,
                        color: myOrangeAccent,
                      ),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: myOrangeAccent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                titlePadding: const EdgeInsets.all(0),
                                title: Container(
                                    decoration: const BoxDecoration(
                                        color: myOrange,
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(5))),
                                    child: const Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Text('Confirm Delete',
                                          style: TextStyle(color: myFontColor)),
                                    )),
                                contentPadding: EdgeInsets.zero,
                                content: Container(
                                  padding: const EdgeInsets.all(20),
                                  decoration: const BoxDecoration(
                                      border: Border(
                                          left: BorderSide(
                                              color: myOrange,
                                              style: BorderStyle.solid,
                                              width: 2),
                                          right: BorderSide(
                                              color: myOrange,
                                              style: BorderStyle.solid,
                                              width: 2))),
                                  child: const Text(
                                      'Are you sure you want to delete this category and all its connected tasks?',
                                      style: TextStyle(color: Colors.black)),
                                ),
                                actionsPadding: EdgeInsets.zero,
                                actions: <Widget>[
                                  Container(
                                      decoration: const BoxDecoration(
                                        color: myOrange,
                                        borderRadius: BorderRadius.vertical(
                                            bottom: Radius.circular(5)),
                                      ),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: TextButton(
                                              onPressed: () {
                                                Navigator.of(context)
                                                    .pop(); // Close the dialog without adding/updating a task
                                              },
                                              child: const Text('No',
                                                  style: TextStyle(
                                                      color: myFontColor,
                                                      fontSize: 18)),
                                            ),
                                          ),
                                          Expanded(
                                              child: Container(
                                            decoration: const BoxDecoration(
                                                border: Border(
                                                    left: BorderSide(
                                                        color: myOrangeAccent,
                                                        style:
                                                            BorderStyle.solid,
                                                        width: 1))),
                                            child: TextButton(
                                              onPressed: () async {
                                                if (id != null) {
                                                  categoryProvider
                                                      .deleteCategory(id!);
                                                  Navigator.of(context).pop();
                                                }
                                              },
                                              child: const Text('Yes',
                                                  style: TextStyle(
                                                      color: myFontColor,
                                                      fontSize: 18)),
                                            ),
                                          ))
                                        ],
                                      ))
                                ],
                              );
                            });
                      }),
                ],
              )),
        ],
      ),
    );
  }
}
