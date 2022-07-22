import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  // final String categoryId;
  // final String categoryTitle;
  // CategoryMealsScreen(this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    //забираем мапу из готового списка
    //через запрос переданный в списов в экране категорий

    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    //получаем значение из мапы ид и титле

    final categoryId = routeArgs['id'];
    final categoryTitle = routeArgs['title'];

    //передаем ешеду на экран

    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: Center(child: Text('the Recipies for the Category')));
  }
}
