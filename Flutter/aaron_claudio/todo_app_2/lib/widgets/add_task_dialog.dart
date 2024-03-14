import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app_2/models/category.dart';
import 'package:todo_app_2/models/task.dart';
import 'package:todo_app_2/utils/firebase_service.dart';

// Category defaultCategory = Category("Others");

class AddTaskDialog extends StatefulWidget {
  const AddTaskDialog(
      {super.key,
      this.task,
      required this.onAddCategory,
      required this.categories});

  final Task? task;
  final void Function(String) onAddCategory;
  final List<Category> categories;

  @override
  State<AddTaskDialog> createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends State<AddTaskDialog>
    with SingleTickerProviderStateMixin {
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;
  late Category? _selectedCategory;
  late List<Category> _categoryReferences;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
    _categoryReferences = widget.categories.toList();
    _selectedCategory = widget.task?.category;
    _tabController = TabController(length: 2, vsync: this);
    if (widget.task != null) {
      _titleController.text = widget.task!.title;
      _descriptionController.text = widget.task!.description;
    }
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // title: const Text("ToDo Manager"),
      content: SizedBox(
        width: double.maxFinite,
        height: 410, // Adjust the height as needed
        child: Column(
          children: [
            TabBar(
              controller: _tabController,
              tabs: const [
                Tab(text: 'Manage Tasks'),
                Tab(text: 'Manage Categories'),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // Content of Tab 1
                  _buildTaskTab(),
                  // Content of Tab 2
                  _buildCategoryTab()
                ],
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Close'),
        ),
      ],
    );
  }

  Widget _buildTaskTab() {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 10),
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Title",
                floatingLabelBehavior: FloatingLabelBehavior.always),
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 10),
          TextField(
            controller: _descriptionController,
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Description",
                floatingLabelBehavior: FloatingLabelBehavior.always),
            minLines: 5,
            maxLines: 5,
          ),
          const SizedBox(height: 10),
          if (_categoryReferences.isNotEmpty)
            DropdownButtonFormField<Category>(
              value: _selectedCategory,
              hint: const Text("Select Category"),
              decoration: const InputDecoration(
                  labelText: "Category",
                  border: OutlineInputBorder(),
                  floatingLabelBehavior: FloatingLabelBehavior.always),
              items: _categoryReferences.map((category) {
                return DropdownMenuItem<Category>(
                    value: category, child: Text(category.name));
              }).toList(),
              onChanged: (Category? value) {
                setState(() {
                  _selectedCategory = value;
                });
              },
              validator: (value) {
                if (value == null) {
                  return "Please select category";
                }
                return null;
              },
              isExpanded: true,
            ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity, // Ensure full width
            child: ElevatedButton(
              onPressed: () async {
                // Task task = Task(
                //   id: DateTime.now().toString(),
                //   title: _titleController.text,
                //   description: _descriptionController.text,
                //   dateCreated: DateTime.now(),
                //   category: _selectedCategory ?? defaultCategory,
                // );
                // if (widget.task != null) {
                //   task = Task(
                //       id: widget.task!.id,
                //       title: _titleController.text,
                //       description: _descriptionController.text,
                //       dateCreated: widget.task!.dateCreated,
                //       isChecked: widget.task!.isChecked,
                //       category: _selectedCategory!);
                //   await FirebaseService.updateTask(task);
                // }
                // await FirebaseService.addTask(task);
                Task task;
                //update task
                if (widget.task != null) {
                  task = Task(
                      id: widget.task!.id,
                      title: _titleController.text,
                      description: _descriptionController.text,
                      dateCreated: widget.task!.dateCreated,
                      isChecked: widget.task!.isChecked,
                      categoryReference: _selectedCategory != null
                          ? _selectedCategory!.reference
                              as DocumentReference<Object>
                          : null,
                      category: widget.task!.category);
                  await FirebaseService.updateTask(task);
                }
                //add new task
                else {
                  task = Task(
                    id: DateTime.now().toString(),
                    title: _titleController.text,
                    description: _descriptionController.text,
                    dateCreated: DateTime.now(),
                    categoryReference: _selectedCategory != null
                        ? _selectedCategory!.reference
                            as DocumentReference<Object>
                        : null,
                    category: _selectedCategory ??
                        Category(
                            name: "Default Category",
                            reference: FirebaseFirestore.instance
                                .collection('categories')
                                .doc()),
                  );

                  await FirebaseService.addTask(task);
                }
                if (mounted) {
                  Navigator.of(context).pop(task);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[600],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                "Save",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryTab() {
    String newCategoryName = "";

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 10),
          TextField(
            onChanged: (value) {
              newCategoryName = value;
            },
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Category Name",
                floatingLabelBehavior: FloatingLabelBehavior.always),
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity, // Ensure full width
            child: ElevatedButton(
              onPressed: () {
                if (newCategoryName.isNotEmpty) {
                  widget.onAddCategory(newCategoryName);
                  setState(() {
                    _categoryReferences = widget.categories.toList();
                    _selectedCategory = _categoryReferences.isNotEmpty
                        ? _categoryReferences.first
                        : null;
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[600],
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                "Save",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
          Column(
            children: widget.categories.map((category) {
              return ListTile(
                title: Text(category.name),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
