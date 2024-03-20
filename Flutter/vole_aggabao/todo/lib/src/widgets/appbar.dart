import 'package:flutter/material.dart';
import 'package:todo/src/data/models/category.dart';

class TodoAppbar extends StatefulWidget implements PreferredSizeWidget {
  final List<Category> categories;
  final Function(String, int) filterTasks;

  const TodoAppbar({
    super.key,
    required this.categories,
    required this.filterTasks,
  });

  @override
  State<TodoAppbar> createState() => _TodoAppbarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _TodoAppbarState extends State<TodoAppbar> {
  String searchFilter = '';
  int categoryFilter = 0;
  bool showSearch = false;
  FocusNode searchFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: !showSearch
        ? const Text('Tasks')
        : TextField(
          focusNode: searchFocusNode,
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.search),
            hintText: 'Search tasks',
          ),
          onChanged: (searchValue) {
            setState(() => searchFilter = searchValue);
            widget.filterTasks(searchValue, categoryFilter);
          },
        ),
        backgroundColor: Colors.grey[900],
        foregroundColor: Colors.grey[200],
        scrolledUnderElevation: 0,
        actions: [
          IconButton(
            icon: !showSearch ? const Icon(Icons.search) : const Icon(Icons.search_off),
            onPressed: () { 
              setState(() {
                showSearch = !showSearch;
                if (showSearch == false) {
                  searchFilter = '';
                }
              });
              if (showSearch) {
                searchFocusNode.requestFocus();
              }
              widget.filterTasks(searchFilter, categoryFilter);
            },
          ),
          MenuAnchor(
            builder: (context, controller, child) {
              return IconButton(
                onPressed: () {
                  if (controller.isOpen) {
                    controller.close();
                  } else {
                    controller.open();
                  }
                },
                icon: const Icon(Icons.filter_alt_outlined),
              );
            },
            menuChildren: [
              MenuItemButton(
                leadingIcon: const Icon(Icons.circle, color: Colors.grey, size: 18),
                child: const Text('All'),
                onPressed: () {
                  categoryFilter = 0;
                  widget.filterTasks(searchFilter, 0);
                },
              ),
              ...widget.categories.map((category) {
                return MenuItemButton(
                  leadingIcon: Icon(Icons.circle, color: category.color, size: 18),
                  child: Text(category.name),
                  onPressed: () {
                    categoryFilter = category.id;
                    widget.filterTasks(searchFilter, category.id);
                  },
                );
              }),
            ],
          )
        ],
      );
  }
}