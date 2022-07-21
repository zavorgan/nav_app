import 'package:flutter/material.dart';

//модель класса category  для определения переменных в классе

class Category {
  final String id;
  final String title;
  final Color color;

  const Category(
      {@required this.id,
      @required this.title,
      @required this.color = Colors.orange});
}
