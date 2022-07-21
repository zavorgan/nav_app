import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      //создаем сетку
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        mainAxisExtent: 200, //макс ширина
        childAspectRatio: 3 / 2, // соотношение сторон
        crossAxisSpacing: 20, //отступы
        mainAxisSpacing: 20,
      ),
      children: <Widget>[],
    );
  }
}
