import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/widgets/appBar.dart';
import 'package:todo_app/widgets/categoryGridItem.dart';
import '../models/categories.dart';
import '../widgets/categoryDialog.dart';

import '../constants/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  TextEditingController searchController = TextEditingController();
  String searchText = '';

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: myOrangeAccent,
      appBar: MyAppBar(
        titleText: 'Home',
        searchController: searchController,
        onSearch: (value) {
          setState(() {
            searchText = value;
          });
        },
        onClearSearch: () {
          searchController.clear();
          setState(() {
            searchText = '';
          });
        }
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
        child: Column(
          children: [
            Expanded(
              child: Consumer<CategoryProvider>(
                builder: (context, categoryProvider, _) {
                  return FutureBuilder<List<Categories>>(
                      future: categoryProvider.myCategories,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          List<Categories> categories = snapshot.data ?? [];
                          categories.insert(
                            0,
                            Categories(
                                id: -1,
                                categoryLabel: 'Add Category',
                                isActive: true)
                          );
                          final filteredCategories = categories.where((category) {
                            return category.categoryLabel.toLowerCase().contains(searchText.toLowerCase());
                          }).toList();

                          return GridView.builder(
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              childAspectRatio: 1),
                            itemCount: filteredCategories.length,
                            itemBuilder: (context, index) {
                                final category = filteredCategories[index];
                                if(category.id == -1) {
                                  return InkWell(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return CategoryDialog(labelController: TextEditingController(text: ''));

                                          });
                                    },
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: myOrangeAccent,
                                        border: Border.all(color: myOrange, style: BorderStyle.solid, width: 2),
                                        borderRadius: BorderRadius.circular(10)
                                      ),
                                      padding: EdgeInsets.all(10),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.add, color: myDarkOrange, size: 25,),
                                          SizedBox(width: 8),
                                          Text('Add Category', style: TextStyle(color: myDarkOrange, fontSize: 20),)
                                        ],
                                      ),
                                    ),
                                  );
                                }
                                return CategoryItem(category: category.toMap());
                              });
                        }
                      });
                },
              )

            )
          ],
        ),
      ),

    );
  }
}