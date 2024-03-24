import 'package:flutter/material.dart';

class ForecastTile extends StatelessWidget {
  final String day;
  final String condition;
  final int high;
  final int low;
  final Color? textColor;

  const ForecastTile({
    super.key,
    required this.day,
    required this.condition,
    required this.high,
    required this.low,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        day,
        style: TextStyle(color: textColor),
      ),
      subtitle: Text(
        condition,
        style: TextStyle(color: textColor),
      ),
      leading: Icon(Icons.wb_sunny, color: textColor),
      trailing: Text(
        '$high° / $low°',
        style: TextStyle(color: textColor),
      ),
    );
  }
}
