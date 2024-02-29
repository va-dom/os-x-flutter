import 'package:flutter/material.dart';
import 'package:todo_app_2/models/category.dart';
import 'package:todo_app_2/models/task.dart';


Category defaultCategory = Category("Others");

class AddTaskDialog extends StatefulWidget{

  const AddTaskDialog({
    super.key,
    this.task,
    required this.onAddCategory,
    required this.categories
  });

  final Task? task;
  final void Function(String) onAddCategory;
  final List<Category> categories;

  @override
  State<AddTaskDialog> createState() => _AddTaskDialogState();
  
}

class _AddTaskDialogState extends State<AddTaskDialog> with SingleTickerProviderStateMixin {

  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;
  late Category? _selectedCategory;
  late List<Category> _categories;
  late TabController _tabController;
  
  @override
  void initState(){
    super.initState();
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
    // _categories = widget.categories;
    // _selectedCategory = widget.task?.category;
    _categories = [defaultCategory, ...(widget.categories)];
  _selectedCategory = widget.task?.category;
  if (_selectedCategory == null && _categories.isNotEmpty) {
    _selectedCategory = _categories.first;
  }
    _tabController = TabController(length: 2, vsync: this );
    if(widget.task != null){
      _titleController.text = widget.task!.title;
      _descriptionController.text = widget.task!.description;
    }
  }

  @override
  void dispose(){
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
        height: 300, // Adjust the height as needed
        child: Column(
          children: [
            TabBar(
              controller: _tabController,
              tabs: const[
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


  Widget _buildTaskTab(){
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Title",
            ),
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 10),
          TextField(
            controller: _descriptionController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Description",
            ),
            minLines: 1,
            maxLines: 5,
          ),
          const SizedBox(height: 10),
          if(_categories.isNotEmpty)
            DropdownButtonFormField<Category>(
              value: _selectedCategory,
              hint: const Text("Select Category"),
              items: _categories.map((Category category) {
                return DropdownMenuItem<Category>(
                  value: category,
                  child: Text(category.name),
                );
              }).toList(),
              onChanged: (Category? value) {
                setState(() {
                  _selectedCategory = value;
                });
              },
              validator: (value){
                if(value == null){
                  return "Please select category";
                }
                return null;
              },
              isExpanded: true,
            ),
          const SizedBox(height: 10),
          TextButton(
            onPressed: () {
              Task task = Task(
                id: DateTime.now().toString(),
                title: _titleController.text,
                description: _descriptionController.text,
                dateCreated: DateTime.now(),
                category: _selectedCategory ?? defaultCategory,
              );
              if(widget.task != null){
                task = Task(
                  id: widget.task!.id,
                  title: _titleController.text,
                  description: _descriptionController.text,
                  dateCreated: widget.task!.dateCreated,
                  isChecked: widget.task!.isChecked,
                  category: _selectedCategory!
                );
              }
              Navigator.of(context).pop(task);
            },
            style: TextButton.styleFrom(
              backgroundColor: Colors.deepPurpleAccent[700],
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 16
              )
            ),
            child: const Text(
              "Save",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryTab(){

    String newCategoryName = "";

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
          onChanged: (value) {
            newCategoryName = value;
          },
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Category Name",
          ),
          textInputAction: TextInputAction.next,
        ),
          const SizedBox(height: 10),
          TextButton(
            onPressed: () {
              if(newCategoryName.isNotEmpty){
                widget.onAddCategory(newCategoryName);
                setState(() {
                  _categories = [defaultCategory, ...widget.categories];
                  _selectedCategory = defaultCategory;
                });
              }
            },
            style: TextButton.styleFrom(
              backgroundColor: Colors.deepPurpleAccent[700],
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 16
              )
            ),
            child: const Text(
              "Save",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16
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