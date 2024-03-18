import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/tasks.dart';
import 'package:todo_app/widgets/taskDialog.dart';
import 'package:todo_app/widgets/appBar.dart';
import '../models/categories.dart';
import '../widgets/myCheckboxFilter.dart';
import '../widgets/taskListItem.dart';

import '../constants/colors.dart';

enum Filters { empty, trueValue, falseValue }

class TaskScreen extends StatefulWidget {
  TaskScreen({super.key, required this.categoryId, required this.categoryName});

  final int? categoryId;
  final String categoryName;

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  late ValueNotifier<CustomCheckboxState> completedFilter;
  late ValueNotifier<CustomCheckboxState> bookmarkedFilter;

  @override
  void initState() {
    super.initState();
    completedFilter =
        ValueNotifier<CustomCheckboxState>(CustomCheckboxState.empty);
    bookmarkedFilter =
        ValueNotifier<CustomCheckboxState>(CustomCheckboxState.empty);
  }

  void _showFilterSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Container(
                color: myOrange,
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomCheckbox(
                        title: 'Completed',
                        initialValue: completedFilter,
                        onChanged: (state) {
                          setState(() {
                            completedFilter.value = state;
                          });
                        }),
                    CustomCheckbox(
                        title: 'Bookmarked',
                        initialValue: bookmarkedFilter,
                        onChanged: (state) {
                          setState(() {
                            bookmarkedFilter.value = state;
                          });
                        }),
                  ],
                ));
          });
        });
  }

  TextEditingController searchController = TextEditingController();
  String searchText = '';

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);
    return Scaffold(
      backgroundColor: myOrangeAccent,
      appBar: MyAppBar(
        titleText: widget.categoryName,
        searchController: searchController,
        onSearch: (value) {
          setState(() {
            searchText = value;
          });
        },
        showBackButton: true,
        onClearSearch: () {
          searchController.clear();
          setState(() {
            searchText = '';
          });
        },
        onOpenFilter: () => _showFilterSheet(context),
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
        child: Column(
          children: [
            Expanded(
              child: ValueListenableBuilder<CustomCheckboxState>(
                valueListenable: completedFilter,
                builder: (context, completedValue, _) {
                  return ValueListenableBuilder<CustomCheckboxState>(
                    valueListenable: bookmarkedFilter,
                    builder: (context, bookmarkedValue, _) {
                      return FutureBuilder<List<Task>>(
                        future: taskProvider.myTasks(widget.categoryId!),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else {
                            final tasks = snapshot.data ?? [];

                            if (tasks.isEmpty) {
                              return const Center(
                                  child: Text(
                                "You have no tasks.",
                                style: TextStyle(
                                    color: myDarkOrange, fontSize: 18),
                              ));
                            }
                            final sortedTask = tasks;
                            sortedTask.sort((task1, task2) {
                              final isTask1Bookmarked = task1.isBookmarked;
                              final isTask2Bookmarked = task2.isBookmarked;

                              if (isTask1Bookmarked && !isTask2Bookmarked) {
                                return -1;
                              } else if (!isTask1Bookmarked &&
                                  isTask2Bookmarked) {
                                return 1;
                              } else {
                                return task1.taskTitle
                                    .compareTo(task2.taskTitle);
                              }
                            });

                            final filteredTasks = sortedTask.where((task) {
                              if (completedValue ==
                                  CustomCheckboxState.checked) {
                                if (!task.isCompleted) return false;
                              } else if (completedValue ==
                                  CustomCheckboxState.cross) {
                                if (task.isCompleted) return false;
                              }

                              if (bookmarkedValue ==
                                  CustomCheckboxState.checked) {
                                if (!task.isBookmarked) return false;
                              } else if (bookmarkedValue ==
                                  CustomCheckboxState.cross) {
                                if (task.isBookmarked) return false;
                              }

                              if (searchText.isNotEmpty) {
                                return task.taskTitle
                                    .toLowerCase()
                                    .contains(searchText.toLowerCase());
                              }
                              return true;
                            }).toList();

                            return ListView.builder(
                              itemCount: filteredTasks.length,
                              itemBuilder: (context, index) {
                                final task = filteredTasks[index];
                                return TaskItem(task: task.toMap());
                              },
                            );
                          }
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(widget.categoryId);
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return SingleChildScrollView(
                    child: MediaQuery(
                        data: MediaQuery.of(context)
                            .copyWith(viewInsets: EdgeInsets.zero),
                        child: ChangeNotifierProvider<CategoryProvider>(
                            create: (context) => CategoryProvider(),
                            child: TaskDialog(
                              initialCategoryId: widget.categoryId,
                              titleController: TextEditingController(text: ''),
                              isCompleted: false,
                              isBookmarked: false,
                            ))));
              });
        },
        backgroundColor: myOrange,
        tooltip: 'Add Task',
        child: Icon(
          Icons.add,
          color: myOrangeAccent,
          size: 30,
        ),
      ),
    );
  }
}
