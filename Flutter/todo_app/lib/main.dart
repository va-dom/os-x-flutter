import 'package:flutter/material.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/screens/home.dart';
import 'package:todo_app/widgets/taskDialog.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/screens/taskList.dart';

import 'models/categories.dart';
import 'models/tasks.dart';

void main() {
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => CategoryProvider()),
          ChangeNotifierProvider(create: (context) => TaskProvider()),
        ],
    child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (context) => CategoryProvider(),
      child: MaterialApp(
        title: 'My Categories',
        theme: ThemeData(
          textTheme: const TextTheme(
            bodyLarge: TextStyle(color: myFontColor),
            bodyMedium: TextStyle(color: Colors.white)
          ),
          fontFamily: "DKCoolCrayon"

        ),
        home: HomeScreen(),
      )

    );
  }
}




